#!/bin/bash

speedtest_server_id=$1
influx_post_url=$2
influx_measurement=$3

csv=$(speedtest-cli --csv --server $speedtest_server_id)

ping=$(echo $csv | cut -d ',' -f 6)
download=$(echo $csv | cut -d ',' -f 7)
upload=$(echo $csv | cut -d ',' -f 8)

curl -X POST $influx_post_url \
    --data-binary "$influx_measurement ping=$ping,download=$download,upload=$upload"