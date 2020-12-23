#!/bin/bash

mkdir -p /app/opencv-build
cd /app/opencv-build
python ../opencv/platforms/android/build_sdk.py --config=ndk-17.config.py
