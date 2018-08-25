#! /bin/bash

send_flag=false
while true
do

# Get available memory info
avail=$(cat /proc/meminfo | grep MemAvailable | awk '{print $2}')

# check if available memory is less or equal to 1.5GB
if [[ "$avail" -le 10000000 && $send_flag == false ]]; then

# send email if system memory is running low
/usr/sbin/ssmtp 302566290@qq.com</home/speit/cw-lab/monitor_email/alert_info.txt & xdotool key ctrl+d
send_flag=true
echo last_time=$( date +%s ) > log.log
fi

# read last sending time
source log.log
current_time=$( date +%s )

# compute the interval between current time and last time
interval=$(( ${current_time}-${last_time} ))

# if the interval is bigger than 30 minutes, resend the email
if [[ "$interval" -gt 1800 ]]; then
echo $interval
last_time=$( date +%s ) > log.log
send_flag=false
echo 
fi

done
exit 0


