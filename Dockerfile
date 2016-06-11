FROM raatiniemi/gradle:latest-jdk-7
MAINTAINER Tobias Raatiniemi <raatiniemi@gmail.com>

ENV ANDROID_SDK_VERSION 24.4.1
ENV ANDROID_HOME /opt/android-sdk

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -yq libstdc++6:i386 zlib1g:i386 libncurses5:i386 --no-install-recommends \
    && mkdir -p "${ANDROID_HOME}" \
    && curl -Ls http://dl.google.com/android/android-sdk_r${ANDROID_SDK_VERSION}-linux.tgz \
        | tar -xz --directory "${ANDROID_HOME}" --strip-components=1 --no-same-owner
