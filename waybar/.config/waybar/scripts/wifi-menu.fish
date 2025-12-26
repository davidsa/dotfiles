#!/usr/bin/env fish

# Enable Wi-Fi if disabled
if test (nmcli -t -f WIFI g) != "enabled"
    nmcli radio wifi on
end

# Get Wi-Fi list
set networks (
    nmcli -t -f IN-USE,SECURITY,SSID,SIGNAL dev wifi list |
    awk -F: '
    {
        used = ($1 == "*") ? "✓" : " "
        secure = ($2 == "--") ? "󰤨" : "󰤪"
        printf "%s\t%s\t%s\t%s%%\n", used, secure, $3, $4
    }'
)

# Show menu
set choice (printf "%s\n" $networks | wofi --dmenu -i -W 400 -H 200 -p "Wi-Fi")

# Exit if nothing selected
test -z "$choice"; and exit 0

# Extract SSID
set ssid (echo $choice | awk -F'\t' '{print $3}')

# Connect
if nmcli -g NAME con show | grep -qx "$ssid"
    nmcli con up "$ssid"
else
    nmcli dev wifi connect "$ssid"
end
