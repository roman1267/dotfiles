#!/bin/bash

onedrive_upload_activity="$(ss -Op | grep onedrive | grep -v "CLOSE-WAIT" | awk '{print $4}')"
onedrive_download_activity="$(ss -Op | grep onedrive | grep -v "CLOSE-WAIT" | awk '{print $3}')"
is_active=0

for activity in $onedrive_upload_activity; do
    if [ $((${activity:=0})) -gt "0" ]; then
        is_active=1
    fi
done

for activity in $onedrive_download_activity; do
    if [ $((${activity:=0})) -gt "0" ]; then
        is_active=1
    fi
done
if [ $is_active -eq 1 ]; then
    echo " "
else
    echo
fi
