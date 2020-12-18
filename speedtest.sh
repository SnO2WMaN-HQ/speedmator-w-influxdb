#!/bin/bash
 
influx_post_url=$1
influx_measurement=$2

csv=$(speedtest-cli --csv)

ping=$(echo $csv | cut -d ',' -f 6)
download=$(echo $csv | cut -d ',' -f 7)
upload=$(echo $csv | cut -d ',' -f 8)

curl -X POST $influx_post_url \
    --data-binary "$influx_measurement ping=$ping,download=$download,upload=$upload"