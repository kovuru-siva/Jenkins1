#!/bin/bash
#
#server_status="pending"

#while [ "$server_status" != "running" ]; do
#	server_status=$(aws ec2 describe-instances --instance-ids i-04c1821cbce022f87 --query 'Reservations[0].Instances[0].State.Name' --output text)
#	echo "Current Server status is $server_status"
#	sleep 5
#done

#echo "Server is running."
#
echo "############## CHECKING THE INSTANCE STAUTS################"

Instance_ID=$(aws ec2 run-instances --image-id ami-0614680123427b75e --instance-type t2.micro --query Instances[0].InstanceId --output text)

server_status="pending"
while [ "$server_status" != "running" ]; do
        server_status=$(aws ec2 describe-instances --instance-ids $Instance_ID --query 'Reservations[0].Instances[0].State.Name' --output text)
        echo "Current Server status is $server_status"
        sleep 5
done

echo "Server is running."
