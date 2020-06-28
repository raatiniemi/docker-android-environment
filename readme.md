# android-environment

[![Docker Automated build](https://img.shields.io/docker/automated/raatiniemi/android-environment.svg)](https://hub.docker.com/r/raatiniemi/android-environment/)
[![Docker Build Status](https://img.shields.io/docker/build/raatiniemi/android-environment.svg)](https://hub.docker.com/r/raatiniemi/android-environment/)
[![Docker Pulls](https://img.shields.io/docker/pulls/raatiniemi/android-environment.svg)](https://hub.docker.com/r/raatiniemi/android-environment/)

Docker container image for building Android applications in an CI/CD pipeline.

## Usage

The [container image is available at Docker Hub](https://hub.docker.com/r/raatiniemi/android-environment/)
via `raatiniemi/android-environment:latest`.

The container image comes preinstalled with:

* Android tools SDK
* Platform tools

### Install additional Android tools

In order to install additional Android tools the use of `sdkmanager` is
recommended, and when using the `sdkmanager` the license must be accepted.

The following is a sample script for installing the `build-tools` aswell as a
version of the Android API.

```bash
function accept_license_and_install {
  yes | sdkmanager $1 1>/dev/null;
  if [ $? -ne 0 ]; then
    echo "Failed to accept license and install ${1}";
    exit 1;
  fi
}

accept_license_and_install "build-tools;27.0.3";
accept_license_and_install "platforms;android-27";
```

### Preinstalled Android API

In an effort to reduce build time in an CI/CD pipeline, there is a version
available where the Android API have been preinstalled.

This version is available using another tag, e.g.:

* `android-28` for the Android API 28 preinstalled.
* `android-29` for the Android API 29 preinstalled.
* `android-30` for the Android API 30 preinstalled.

*The build tools are not installed since these are installed when the
`gradlew` command is executed.*
