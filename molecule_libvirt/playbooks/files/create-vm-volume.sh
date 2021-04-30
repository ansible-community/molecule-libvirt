#!/bin/env bash

OPTIND=1

while getopts ":n:s:p:o:" opt; do
  case ${opt} in
    n)
       INSTANCE_NAME=$OPTARG;;
    s)
       INSTANCE_DISK_SIZE=$OPTARG;;
    p)
       DEFAULT_VM_PATH=$OPTARG;;
    o)
       ORIGINAL_IMAGE=$OPTARG;;
    \?) echo "Usage: $0 -n <instance_name> -s <disk_size> -p <vm_image_path> -o <source_image>"
        exit 1
     ;;
  esac
done

if ! [[ -n $INSTANCE_NAME && -n $ORIGINAL_IMAGE ]]; then
    echo "Mandatory options are missing (-n <name> and/or -o <source_image>)"  >&1
    echo "Usage: $0 -n <instance_name> -s <disk_size> -p <vm_image_path> -o <source_image>"
    exit 1
fi

## set variables
#INSTANCE_NAME="instance"
#ORIGINAL_IMAGE="Fedora-Cloud-Base-33-1.2.x86_64.qcow2"

if ! [[ -n $INSTANCE_DISK_SIZE ]]; then
  INSTANCE_DISK_SIZE="20G"
fi

if ! [[ -n $DEFAULT_VM_PATH ]]; then
  DEFAULT_VM_PATH="/var/lib/libvirt/images"
fi

INSTANCE_FULL_PATH="$DEFAULT_VM_PATH"

# echo "Instance name $INSTANCE_NAME"
# echo "Disk size: $INSTANCE_DISK_SIZE"
# echo "Default vm path: $DEFAULT_VM_PATH"
# echo "Original : $ORIGINAL_IMAGE"

## copy qcow2 in host
#cp -v /home/james/Downloads/$ORIGINAL_IMAGE $DEFAULT_VM_PATH/$INSTANCE_NAME.qcow2

# change to default vm folder
cd $DEFAULT_VM_PATH

# create an image with the provided size
qemu-img create -f qcow2 -o preallocation=metadata $INSTANCE_NAME-temp.qcow2 $INSTANCE_DISK_SIZE

export LIBGUESTFS_BACKEND=direct

# expand original image on the new sized volume
virt-resize --quiet --expand /dev/sda1 $INSTANCE_NAME.qcow2 $INSTANCE_NAME-temp.qcow2

# rename
mv -v $INSTANCE_NAME-temp.qcow2 $INSTANCE_NAME.qcow2
