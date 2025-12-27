#!/usr/bin/env fish

set options \
    "󰤄 Hibernate" \
    " Restart" \
    "󰐥 Power Off"

set choice (printf "%s\n" $options | wofi --dmenu -i -W 400 -H 200 -p "Power")

test -z "$choice"; and exit 0

switch "$choice"
    case "*Hibernate*"
        systemctl hibernate
    case "*Restart*"
        systemctl reboot
    case "*Power Off*"
        systemctl poweroff
end
