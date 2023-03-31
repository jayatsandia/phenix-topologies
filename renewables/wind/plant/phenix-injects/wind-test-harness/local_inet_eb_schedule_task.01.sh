#!/bin/bash 
REQFILE="ebsessiongood.var"

if [ ! -f $REQFILE ]
then
	echo "Requisite file not found, SKIP"
	exit 1
fi

FEAT="schedule-task"

msfrpc -a 127.0.0.1 -P letmein <<EOF
irb_context.echo = false
rpc.call('session.meterpreter_script', 1, 'wind_schtask')
sleep 2
data = rpc.call('session.meterpreter_read', 1)
puts data
exit
EOF
