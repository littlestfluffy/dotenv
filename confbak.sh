#! /bin/bash

DESTINATIONDIR="/tmp"

NOW=$(date +"%Y%m%dt%H%M%S")
FILENAME="${HOSTNAME}-confs.${NOW}"
CONFIGS=(
 .config/hypr/rules.conf
 .config/hypr/settings.conf
 .config/storeBackup/storeBackup.conf
)

echo "Backupping to ${DESTINATIONDIR}:"
tar -cvf ${DESTINATIONDIR}/${FILENAME}.tar ${CONFIGS[@]}
