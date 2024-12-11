#!/bin/bash


if [ "$#" -lt 3 ]; then
echo "Usage: $0 <region> <instance-type> <Ami-Id>"
exit 1
fi

aws_region=$1
INSTANCE_TYPE=$2
AMI_ID=$3

Instance_ID=$(aws ec2 run-instances --region "$aws_region" --image-id "$AMI_ID" --instance-type "$INSTANCE_TYPE" --query Instances[0].InstanceId --output text)

if [ -z "$Instance_ID" ]; then
    echo "Failed to launch the instance. Check your inputs."
    exit 1
fi

echo "Launched instance with ID: $Instance_ID"
server_status="pending"
while [ "$server_status" != "running" ]; do
    server_status=$(aws ec2 describe-instances \
        --region "$aws_region" \
        --instance-ids "$Instance_ID" \
        --query 'Reservations[0].Instances[0].State.Name' \
        --output text)

    echo "Current Server status: $server_status"
    sleep 5
done

echo "Instance $Instance_ID is now running."
