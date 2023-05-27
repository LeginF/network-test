#!/bin/bash

run_test() {
    local ret=$(ping -c 1 $1 | grep round | cut -d ' ' -f 4 | cut -d / -f 1)
    echo $ret
}

for ((; ;))
do
    TIME=$(date +'%m/%d/%Y %H:%M:%S')
    GOOGLE="$(run_test www.google.com)"
    GATEWAY=$(run_test 192.168.68.1)
    MODEM=$(run_test 192.168.100.1)

    echo $TIME,$GOOGLE,$GATEWAY,$MODEM 
    sleep 5
done