FROM ubuntu:20.04

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# install and upgrade
RUN apt-get update && apt-get -y install --no-install-recommends \
    curl \
    git \
    wget \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    && apt-get -y install --reinstall ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install flutter
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 /usr/local/flutter
ENV PATH="$PATH:/usr/local/flutter/bin"

# install java
RUN apt-get update && apt-get -y install --no-install-recommends \
    openjdk-11-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install android sdk
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -O /tmp/android-sdk.zip \
    && unzip /tmp/android-sdk.zip -d /usr/local/android-sdk \
    && rm /tmp/android-sdk.zip
ENV ANDROID_SDK_ROOT="/usr/local/android-sdk"
RUN mkdir -p /usr/local/android-sdk/cmdline-tools/latest
RUN mv /usr/local/android-sdk/cmdline-tools/* /usr/local/android-sdk/cmdline-tools/latest | mkdir -p /usr/local/android-sdk/cmdline-tools/latest
RUN ls -la /usr/local/android-sdk/cmdline-tools/latest
ENV PATH="$PATH:/usr/local/android-sdk/cmdline-tools/latest/bin:/usr/local/android-sdk/platform-tools"
RUN echo ${PATH}
RUN yes | sdkmanager --licenses --sdk_root=${ANDROID_SDK_ROOT}
RUN sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"

# install android studio
RUN wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.3.1.16/android-studio-2021.3.1.16-linux.tar.gz -O /tmp/android-studio.tar.gz \
    && tar -xzf /tmp/android-studio.tar.gz -C /usr/local \
    && rm /tmp/android-studio.tar.gz

# flutter config
RUN yes | flutter doctor --android-licenses
RUN flutter config --no-analytics
RUN flutter config --android-studio-dir /usr/local/android-studio

# flutter linux setup
RUN apt-get update && apt-get -y install --no-install-recommends \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# flutter web install chrome
RUN apt-get update && apt-get -y install --no-install-recommends \
    libxss1 \
    libappindicator1 \
    libindicator7 \
    fonts-liberation \
    xdg-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb \
    && dpkg -i /tmp/google-chrome-stable_current_amd64.deb \
    && rm /tmp/google-chrome-stable_current_amd64.deb

