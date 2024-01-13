# android-environment

[![GPLv3 license](https://img.shields.io/badge/license-GPLv3-blue.svg)](license)
[![Pipeline status](https://gitlab.com/rahome/docker-android-environment/badges/master/pipeline.svg)](https://gitlab.com/rahome/docker-android-environment/)

Docker container image for building Android applications in an CI/CD pipeline,
the container images either use OpenJDK 8 or OpenJDK 11 as the base image.

All images include both:

* Android tools SDK
* Platform tools

Default behaviour require you as a user to install the Android API version that
your application needs. However, there are images available with an Android API
preinstalled which will reduce build times, see [Usage](#usage).

## Usage

The image is available via Docker Hub using the `raatiniemi/android-environment`
name, see [available tags](https://hub.docker.com/r/raatiniemi/android-environment/tags).

### Naming convention

The tags for images include explicit versions, i.e. which JDK version should be
used and for images with Android API preinstalled the API version is included.

* `jdk-17-latest` &mdash; With only required components and OpenJDK 17.
* `jdk-17-android-28-latest` &mdash; With Android API 28 and OpenJDK 17.
* `jdk-17-android-29-latest` &mdash; With Android API 29 and OpenJDK 17.
* `jdk-17-android-30-latest` &mdash; With Android API 30 and OpenJDK 17.
* `jdk-17-android-31-latest` &mdash; With Android API 31 and OpenJDK 17.
* `jdk-17-android-32-latest` &mdash; With Android API 32 and OpenJDK 17.
* `jdk-17-android-33-latest` &mdash; With Android API 33 and OpenJDK 17.
* `jdk-17-android-34-latest` &mdash; With Android API 34 and OpenJDK 17.
* `jdk-11-latest` &mdash; With only required components and OpenJDK 11.
* `jdk-11-android-28-latest` &mdash; With Android API 28 and OpenJDK 11.
* `jdk-11-android-29-latest` &mdash; With Android API 29 and OpenJDK 11.
* `jdk-11-android-30-latest` &mdash; With Android API 30 and OpenJDK 11.
* `jdk-11-android-31-latest` &mdash; With Android API 31 and OpenJDK 11.
* `jdk-11-android-32-latest` &mdash; With Android API 32 and OpenJDK 11.
* `jdk-11-android-33-latest` &mdash; With Android API 33 and OpenJDK 11.
* `jdk-11-android-34-latest` &mdash; With Android API 34 and OpenJDK 11.
* `jdk-8-latest` &mdash; With only required components and OpenJDK 8.
* `jdk-8-android-28-latest` &mdash; With Android API 28 and OpenJDK 8.
* `jdk-8-android-29-latest` &mdash; With Android API 29 and OpenJDK 8.
* `jdk-8-android-30-latest` &mdash; With Android API 30 and OpenJDK 8.
* `jdk-8-android-31-latest` &mdash; With Android API 31 and OpenJDK 8.
* `jdk-8-android-32-latest` &mdash; With Android API 32 and OpenJDK 8.
* `jdk-8-android-33-latest` &mdash; With Android API 33 and OpenJDK 8.
* `jdk-8-android-34-latest` &mdash; With Android API 34 and OpenJDK 8.

*Use of the `latest` tag is not recommended as it do not specify the version of
OpenJDK to use, it currently use OpenJDK 8 but will be migrated to use OpenJDK
11 in the future.*

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

*The build tools are not installed by default since they are installed when
the `gradlew` command is executed.*

### GitLab CI

If you're using GitLab CI to build your application you can include the [GitLab
CI job template](Android.gitlab-ci.yml). The template includes a job that can
be used as a base when building and testing where the Android SDK is required.

The template is based on usage in [Worker](https://gitlab.com/rahome/worker).
If your use case differ, feel free to open an issue to start a discussion.

*Also, if you depend on the template it might be a good idea to lock it
to a specific revision to reduce the possibility of breakage.*

#### `.in-android-environment`

The `.in-android-environment` job uses both `before_script` and `after_script`
to setup and tear down the environment, i.e. only `script` is available for
your operations. Also, it's using a `docker` runner tag to target available
runner(s).

Since Android application needs to be signed you are required to expose the
keystore in an base64 format using the environment variable `KEYSTORE_BASE64`.
It's recommended to use the GitLab CI variables or some other means of
populating the environment variables, **do not include the keystore in your
`.gitlab-ci.yml` as it will be included in your git history**.
