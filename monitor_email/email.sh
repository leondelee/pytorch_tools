#! /bin/bash
while true
do
# Get available memory info
avail = $(cat /proc/meminfo | grep MemAvailable | awk '{print $2}')
# check if available memory is less or equal to 1.5GB
if [[ "$avail" -le 1000000 ]]; then
## send email if system memory is running low
/usr/sbin/ssmtp 302566290@qq.com</home/speit/cw-lab/monitor_email/alert_info.txt & xdotool key ctrl+d
fi
sleep 10m
done
exit 0


