#!/bin/bash

NUM_GPUS=$1

[ ! -e /OpenPCDet/data/waymo/ImageSets ] && ln -s /OpenPCDet/datasets/waymo/ImageSets /OpenPCDet/data/waymo/ImageSets

if [ -z "$NUM_GPUS" ]; then
  echo "Usage: $0 <NUM_GPUS>"
  exit 1
fi

bash scripts/dist_train.sh "$NUM_GPUS" --cfg_file cfgs/waymo_models/dsvt_pillar.yaml --sync_bn
