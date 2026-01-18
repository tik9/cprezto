#!/bin/zsh

local INVERTER_IP="192.168.1.180"
local TIMEOUT=3

pvneu() {
    # Parameter: needed, prod, grid, bat, all (Standard: all)
    local param="${1:-all}"
    local json_data
    
    # Funktion rekursiv mit 'all' auf
    if [[ "$param" == "live" ]]; then
        while true; do
            clear
            pv all
            echo "\n(Aktualisierung. Stoppen mit Strg+C)"
            sleep 300
        done
        return 0
    fi

    json_data=$(curl -s --connect-timeout "$TIMEOUT" "http://$INVERTER_IP/solar_api/v1/GetPowerFlowRealtimeData.fcgi")
    
    if [[ $? -ne 0 ]] || [[ -z "$json_data" ]]; then
        echo "Netzwerkfehler: Wechselrichter $INVERTER_IP nicht erreichbar."
        return 1
    fi

# Zsh-Array-Füllung (f = split by line, @ = keep elements)
    local -a values
    values=("${(@f)$(jq -r '
        ((.Body.Data.Site.P_Load // 0) * -1) | floor,
        (.Body.Data.Site.P_PV // 0) | floor,
        (.Body.Data.Site.P_Grid // 0) | floor,
        (.Body.Data.Inverters."1".SOC // 0) | floor
    ' <<< "$json_data")}")

    if [[ ${#values} -lt 4 ]]; then
        echo "Fehler: Unvollständige JSON-Daten empfangen."
        return 1
    fi

    local needed=$values[1] prod=$values[2]grid=$values[3] bat=$values[4]
        
    case "$param" in
        needed|need|1) echo "${needed}" ;;
        prod|2)        echo "${prod}"   ;;
        grid|3)        echo "${grid}"   ;;
        bat|soc|4)     echo "${bat}%"   ;;
        all)
        local time_str=$(date +"%H:%M Uhr")
            
            echo "-- Status vom $time_str --"
            printf "%-15s %7s\n" "Hausverbrauch:" "${needed} W"
            printf "%-15s %7s\n" "PV-Erzeugung:"  "${prod} W"
            printf "%-15s %7s\n" "Netzbezug:"     "${grid} W"
            printf "%-15s %7s\n" "Batterie-SOC:"  "${bat} %"
            ;;
        *)
            echo "Verfügbare Optionen: needed, prod, grid, bat, all"
            return 1
            ;;
    esac
}

# Aufruf Skript direkt aus Terminal (wenn nicht gesourced)
if [[ "$ZSH_EVAL_CONTEXT" == "toplevel" ]]; then
    pv "$@"
fi