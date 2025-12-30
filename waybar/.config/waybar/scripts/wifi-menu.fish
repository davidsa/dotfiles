#!/usr/bin/env fish

# Enable Wi-Fi if disabled
if test (nmcli -t -f WIFI g) != "enabled"
    nmcli radio wifi on
end

# Get Wi-Fi list with frequency
set networks (
    nmcli -t -f IN-USE,SECURITY,SSID,SIGNAL,FREQ dev wifi list |
    awk -F: '
    {
        # Used mark
        used = ($1 == "*") ? "✓" : " "
        # Security icon
        secure = ($2 == "--") ? "󰤨" : "󰤪"
        # Frequency to band
        if ($5 <= 2484) {
            band = "2.4G"
        } else {
            band = "5G"
        }
        # Print menu line
        printf "%s\t%s\t%s\t%s%%\t%s\n", used, secure, $3, $4, band
    }'
)

# Show menu
set choice (printf "%s\n" $networks | wofi --dmenu -i -W 500 -H 200 -p "Wi-Fi")

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
