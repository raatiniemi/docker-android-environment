# Docker container for building Android applications

Usage: `raatiniemi/android-environment:latest`

The container is based of the `raatiniemi/gradle:latest-jdk-7` which supplies
the JDK 7 and Gradle build environment. On top of this base image, the Android
SDK with build and platform tools are added, aswell as common Android APIs and
support libraries.
