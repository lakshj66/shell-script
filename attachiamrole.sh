#!/bin/bash
aws2 ec2 describe-instances --output text --filters Name=tag:Name,Values="example" --query Reservations[*].Instances[*].[InstanceId] > /tmp/test.txt
instances=/tmp/test.txt
while IFS= read -r line
do
echo "Attaching Role $line"	
aws2 ec2 associate-iam-instance-profile --instance-id $line --iam-instance-profile Name=<rolename>
done < "$instances"
