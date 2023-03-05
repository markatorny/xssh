#!/bin/bash

# check if ngrok is running
if ps aux | grep ngrok | grep -v grep > /dev/null; then
  echo "ngrok is running"
  
  # get the ngrok address and port
  NGROK_ADDR=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
  NGROK_PORT=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url' | awk -F: '{print $3}')

  # display the ngrok address, IP, and port
  echo "ngrok address: $NGROK_ADDR"
  NGROK_IP=$(echo $NGROK_ADDR | awk -F/ '{print $3}')
  echo "ngrok IP: $NGROK_IP"
  echo "ngrok port: $NGROK_PORT"
else
  echo "ngrok is not running"
  
  exit 4
fi

