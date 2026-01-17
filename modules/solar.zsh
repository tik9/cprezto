#!/bin/bash

pv() {
    # Available parameters: needed, prod, grid, bat, all
    local param="${1:-all}"
    local json_data
    
    json_data=$(curl -s http://192.168.1.180/solar_api/v1/GetPowerFlowRealtimeData.fcgi)
    
    if [[ $? -ne 0 ]] || [[ -z "$json_data" ]]; then
        echo "Error: Failed to fetch data from inverter"
        return 1
    fi
    
    read -r needed prod grid bat <<< "$(echo "$json_data" | jq -r '
        (.Body.Data.Site.P_Load // 0) | floor,
        (.Body.Data.Site.P_PV // 0) | floor,
        (.Body.Data.Site.P_Grid // 0) | floor,
        (.Body.Data.Inverters."1".SOC // 0) | floor
    ' 2>/dev/null)"
    
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to parse JSON data"
        echo "Raw response start: ${json_data:0:200}..."
        return 1
    fi
    
    case "$param" in
        needed|need|1)
            echo "${needed}"
            ;;
        prod|production|2)
            echo "${prod}"
            ;;
        grid|3)
            echo "${grid}"
            ;;
        bat|soc|4)
            echo "${bat}%"
            ;;
        all)
            echo "Needed: ${needed}W"
            echo "Production: ${prod}W"
            echo "Grid: ${grid}W"
            echo "Battery: ${bat}%"
            ;;
        *)
            echo "Available parameters:"
            echo "  needed, prod, grid, bat, all"
            echo "  or use numbers: 1, 2, 3, 4"
            return 1
            ;;
    esac
}

# Optional: Keep ptest if you still want raw data
ptest() {
    curl -s http://192.168.1.180/solar_api/v1/GetPowerFlowRealtimeData.fcgi
}

# Debug function if needed
debug() {
    echo "=== Testing pv function ==="
    echo "pv needed: $(pv needed 2>/dev/null)"
    echo "pv prod: $(pv prod 2>/dev/null)"
    echo "pv grid: $(pv grid 2>/dev/null)"
    echo "pv bat: $(pv bat 2>/dev/null)"
    echo "pv all:"
    pv all
}

# If you want to run from command line
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [[ "$1" == "debug" ]]; then
        debug
    elif [[ "$1" == "raw" ]]; then
        ptest
    else
        # Default: show all data
        pv all
    fi
fi