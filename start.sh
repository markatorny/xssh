#!/bin/bash
source /app/config.sh

service ssh start
service nginx start
systemctl start ssh

systemctl start nginx

echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
echo "start ngrok service"
ngrok tcp 3388 --log ".ngrok.log"





