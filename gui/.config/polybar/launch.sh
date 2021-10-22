#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    monitor_count="$(xrandr -q | grep -w connected -c)"
    if [[ "$monitor_count" == "1" ]]; then
        MONITOR=$m TRAY_POS=right polybar --reload main &
    else
        for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
            # Make tray appear on HDMI monitor
            local traypos=''
            if [[ "$m" == "HDMI1" ]]; then
                traypos=right
            fi

            MONITOR=$m TRAY_POS=$traypos polybar --reload main &
        done
    fi
else
    polybar --reload main &
fi
