
alias p_getv='pactl get-sink-volume @DEFAULT_SINK@'
alias p_increase='pactl set-sink-volume @DEFAULT_SINK@ +5%'
alias p_list="pactl list short | grep RUNNING | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,'"
alias p_max='pactl set-sink-volume @DEFAULT_SINK@ 30%'
alias p_min='pactl set-sink-volume @DEFAULT_SINK@ 5%'
alias p_reduce='pactl set-sink-volume @DEFAULT_SINK@ -5%'

alias bat_cap='cat /sys/class/power_supply/BAT0/capacity'
alias bat_stat='cat /sys/class/power_supply/BAT0/status'