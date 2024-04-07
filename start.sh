#!/bin/bash

echo "Starting Minecraft Java server"
java -Xmx6144M -Xms2048M -jar server.jar nogui

echo "Starting tail -f /dev/null"
tail -f /dev/null
