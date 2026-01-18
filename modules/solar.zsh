#!/bin/bash

INVERTER_IP="192.168.1.180"
TIMEOUT=3

pv() {
    # Available parameters: needed, prod, grid, bat, all
    local param="${1:-all}"
    local json_data

    json_data=$(curl -s --connect-timeout "$TIMEOUT" http://$INVERTER_IP/solar_api/v1/GetPowerFlowRealtimeData.fcgi)

    mapfile -t values < <(jq -r '
        ((.Body.Data.Site.P_Load // 0) * -1) | floor,
        (.Body.Data.Site.P_PV // 0) | floor,
        (.Body.Data.Site.P_Grid // 0) | floor,
        (.Body.Data.Inverters."1".SOC // 0) | floor
    ' <<< "$json_data")

    if [[ ${#values[@]} -lt 4 ]]; then
        echo "Unvollständige Daten (erhalten: ${#values[@]}/4)"
        echo "Rohdaten: $json_data"
        return 1
    fi

    needed="${values[0]}"
    prod="${values[1]}"
    grid="${values[2]}"
    bat="${values[3]}"
        
    case "$param" in
        needed|need|1) echo "${needed}" ;;
        prod|2)        echo "${prod}"   ;;
        grid|3)        echo "${grid}"   ;;
        bat|soc|4)     echo "${bat}%"   ;;
        all)
            # %-15s = String, 15 Zeichen breit, linksbündig (-)
            # %7s  = String, 7 Zeichen breit, rechtsbündig
            printf "%-15s %7s\n" "Hausverbrauch:" "${needed} W"
            printf "%-15s %7s\n" "Erzeugung:"  "${prod} W"
            printf "%-15s %7s\n" "Netzbezug:"     "${grid} W"
            printf "%-15s %7s\n" "Batterie:"  "${bat} %"
            ;;
        *)
            echo "Optionen needed, prod, grid, bat, all or 1-4"
            return 1
            ;;
    esac
}

# run from command line
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    pv "$1"
fi