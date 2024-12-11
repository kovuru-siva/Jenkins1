#!/bin/bash

server=$1
remote_command=$2

for i in "{server[$@]}";
do
echo "connection to server"

 ssh jenkins@$server $remote_command

 if [ $? -eq 0 ]; then
 echo "Command exicuted succesfully"
 else
 echo "Failed to exicute the command"

 fi
 echo "-------------------"

 done
