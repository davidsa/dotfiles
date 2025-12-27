#!/usr/bin/env fish

if not bluetoothctl show | grep -q "Powered: yes"
    bluetoothctl power on > /dev/null
end

# Get devices: MAC \t NAME \t STATUS
set devices (
    bluetoothctl devices | while read -l prefix mac name
        set connected (bluetoothctl info $mac | grep -q "Connected: yes"; and echo "✓"; or echo " ")
        printf "%s\t%s\t%s\n" $connected $name $mac
    end
)

# Exit if no devices
test (count $devices) -eq 0; and exit 0

# Show menu
set choice (printf "%s\n" $devices | wofi --dmenu -i -W 400 -H 200 -p "Bluetooth")

# Exit if nothing selected
test -z "$choice"; and exit 0

# Extract MAC (3rd column)
set mac (echo $choice | awk -F'\t' '{print $3}')

# Toggle connection
if bluetoothctl info $mac | grep -q "Connected: yes"
    bluetoothctl disconnect $mac
else
    bluetoothctl connect $mac
end
