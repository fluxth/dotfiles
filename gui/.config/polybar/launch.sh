#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    monitor_count="$(xrandr -q | grep -w connected -c)"
    if [[ "$monitor_count" == "1" ]]; then
        MONITOR=$m TRAY_POS=right polybar --reload small &
    else
        for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
            # Make tray appear on HDMI monitor
            bar=small
            traypos=''
            if [[ "$m" == "HDMI-1" ]]; then
                traypos=right
                bar=large
            fi

            MONITOR=$m TRAY_POS=$traypos polybar --reload $bar &
        done
    fi
else
    polybar --reload main &
fi
