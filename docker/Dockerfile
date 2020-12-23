# base on https://hub.docker.com/r/runmymind/docker-android-sdk/dockerfile
FROM ubuntu:18.04

ENV ANDROID_SDK_HOME /opt/android-sdk
ENV ANDROID_SDK_ROOT /opt/android-sdk
ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_SDK /opt/android-sdk
ENV ANDROID_NDK /opt/android-sdk/android-ndk-r18b
ENV ANDROID_NDK_HOME /opt/android-sdk/android-ndk-r18b
ENV ANDROID_NDK_ROOT /opt/android-sdk/android-ndk-r18b

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends libncurses5:i386 libc6:i386 libstdc++6:i386 lib32gcc1 lib32ncurses? lib32z1 zlib1g:i386 && \
    apt-get install -y --no-install-recommends openjdk-8-jdk && \
    apt-get install -y --no-install-recommends git wget unzip python vim ant && \
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8

RUN groupadd android && useradd -d /opt/android-sdk -g android -u 1000 android

WORKDIR /opt/android-sdk

RUN mkdir -p /opt/android-sdk && \
    cd /opt/android-sdk && \
    wget -q https://dl.google.com/android/repository/tools_r25.2.5-linux.zip && \
    unzip tools_r25.2.5-linux.zip && \
    rm tools_r25.2.5-linux.zip && \
    wget -q https://dl.google.com/android/repository/android-ndk-r18b-linux-x86_64.zip && \
    unzip android-ndk-r18b-linux-x86_64.zip && \
    rm android-ndk-r18b-linux-x86_64.zip && \
    chown -R android:android .


# accept the license agreements of the SDK components
ADD license_accepter.sh /opt/
RUN chmod +x /opt/license_accepter.sh && /opt/license_accepter.sh $ANDROID_SDK_ROOT && /opt/android-sdk/tools/bin/sdkmanager "cmake;3.6.4111459" "build-tools;26.0.2" "platforms;android-16" "platforms;android-21" "platform-tools"

CMD /app/opencv/build_android.sh
