#!/bin/zsh

local INVERTER_IP="192.168.1.180"
local TIMEOUT=3

pv() {
    # Parameter: needed, prod, grid, bat, all (Standard: all)
    local param="${1:-all}"
    local json_data
    
    # Funktion rekursiv mit 'all'
    if [[ "$param" == "live" ]]; then
        interval=300
        while true; do
            clear
            pv all
            echo "\nAktualisierung alle $interval Sekunden"
            sleep $interval
        done
        return 0
    fi

    json_data=$(curl -s --connect-timeout "$TIMEOUT" "http://$INVERTER_IP/solar_api/v1/GetPowerFlowRealtimeData.fcgi")
    
    if [[ $? -ne 0 ]] || [[ -z "$json_data" ]]; then
        echo "Netzwerkfehler: Wechselrichter nicht erreichbar"
        return 1
    fi

    local -a values
    values=("${(@f)$(jq -r '
        if .Body.Data then
            ((.Body.Data.Site.P_Load // 0) * -1 | floor),
            (.Body.Data.Site.P_PV // 0 | floor),
            (.Body.Data.Site.P_Grid // 0 | floor),
            (.Body.Data.Inverters."1".SOC // 0 | floor)
        else
            "0\n0\n0\n0"
        end
    ' <<< "$json_data")}")

    if [[ ${#values} -lt 4 ]]; then
        echo "Fehler: JSON-Struktur ungültig oder Wechselrichter im Standby."
        return 1
    fi

    local needed=$values[1] 
    local prod=$values[2]
    local grid=$values[3] 
    local bat=$values[4]

    case "$param" in
        needed|need|1) echo "${needed}" ;;
        prod|2)        echo "${prod}"   ;;
        grid|3)        echo "${grid}"   ;;
        bat|soc|4)     echo "${bat}%"   ;;
        all)
            # Bezug >0 = Rot, Einspeisung <=0 = Grün
            if (( grid > 0 )); then
                local color_grid="\e[31m" # Rot
            else
                local  color_grid="\e[32m" # Grün
            fi

            local reset="\e[0m"

            echo "--- PV Status $(date +"%H:%M Uhr") ---"
            printf "%-15s %7s\n" "Verbrauch:" "${needed} W"
            printf "%-15s %7s\n" "Erzeugung:"  "${prod} W"
            # %b für Farbcodes
            printf "%-15s %b%7s%b\n" "Netzbezug:" "$color_grid" "${grid} W" "$reset"
            printf "%-15s %7s\n" "Batterie:"  "${bat} %"
            ;;
        *)
            echo "Verfügbare Optionen: needed, prod, grid, bat, all"
            return 1
            ;;
    esac
}

# Aufruf Skript direkt aus Terminal - nicht gesourced
if [[ "$ZSH_EVAL_CONTEXT" == "toplevel" ]]; then
    pv "$@"
fi