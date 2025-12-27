#!/bin/bash

HOST=192.168.219.153
HOST_DIR=/export
MOUNT_PATH="~/nfs/omv"

usage() {
  echo "Usage: $0 [-h host] [-u]"
  exit 1
}

while getopts "h:u" opt; do
  case $opt in
    h) HOST=$OPTARG ;;
    u)
      echo "Unmounting ${MOUNT_PATH}..."
      sudo umount -f "${MOUNT_PATH}"
      exit 0
      ;;
    *) usage ;;
  esac
done

echo "Mounting ${HOST}:${HOST_DIR} to ${MOUNT_PATH}..."
mkdir -p "${MOUNT_PATH}"
sudo mount -t nfs -o resvport,rw,nfc "${HOST}:${HOST_DIR}" "${MOUNT_PATH}"
