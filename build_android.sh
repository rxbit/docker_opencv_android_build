#!/bin/bash

#cp build_android.sh PATH_OPENCV_SRC
#docker run -rm -v PATH_OPENCV_SRC:/app/opencv

mkdir -p /app/opencv/build-android
cd /app/opencv/build-android
python ../platforms/android/build_sdk.py --config=ndk-17.config.py
