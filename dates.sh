#!/bin/bash

friday="2026-01-02"

if [[ $(uname) == "Darwin" ]]; then
    # Get end date (10 weeks from friday)
    end_date=$(date -v+10w -j -f "%Y-%m-%d" "$friday" "+%Y-%m-%d")
    
    # Generate dates
    current="$friday"
    while [[ "$current" < "$end_date" ]] || [[ "$current" == "$end_date" ]]; do
        # Wednesday 5 days after Friday
        wednesday=$(date -v+5d -j -f "%Y-%m-%d" "$current" "+%Y-%m-%d")
        
        # Format both dates
        friday_fmt=$(date -j -f "%Y-%m-%d" "$current" "+%a %d.%m.%Y")
        wednesday_fmt=$(date -j -f "%Y-%m-%d" "$wednesday" "+%a %d.%m.%Y")
        
        echo "$friday_fmt $wednesday_fmt"
        
        # next period (add 2 weeks)
        current=$(date -v+2w -j -f "%Y-%m-%d" "$current" "+%Y-%m-%d")
    done
else
    # Linux/GNU
    end_date=$(date -d "$friday +10 weeks" "+%Y-%m-%d")
    
    current="$friday"
    while [[ "$current" < "$end_date" ]] || [[ "$current" == "$end_date" ]]; do
        wednesday=$(date -d "$current +5 days" "+%Y-%m-%d")
        
        friday_fmt=$(date -d "$current" "+%a %d.%m.%Y")
        wednesday_fmt=$(date -d "$wednesday" "+%a %d.%m.%Y")
        
        echo "$friday_fmt $wednesday_fmt"
        
        current=$(date -d "$current +2 weeks" "+%Y-%m-%d")
    done
fi