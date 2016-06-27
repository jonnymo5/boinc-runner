#!/bin/bash

sed -i "s/<BOINC_URL>/$BOINC_URL/g" /tmp/boinc.conf
sed -i "s/<BOINC_KEY>/$BOINC_KEY/g" /tmp/boinc.conf

mv /tmp/boinc.conf /etc/init
