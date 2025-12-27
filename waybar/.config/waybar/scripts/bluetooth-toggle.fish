#!/usr/bin/env fish

set powered (bluetoothctl show | grep "Powered:" | awk '{print $2}')

if test "$powered" = "yes"
    bluetoothctl power off
else
    bluetoothctl power on
end
