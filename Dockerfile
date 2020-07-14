#
# GitLab CI: C++ compilers + meson
#
# https://hub.docker.com/r/jfinkhaeuser/gitlab-ci-cpp-meson/
#

FROM ubuntu:20.04
LABEL maintainer="Jens Finkhaeuser <jens@finkhaeuser.de>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
 && apt-get install -qqy --no-install-recommends \
      locales \
      build-essential \
      ninja-build \
      python3 \
      python3-pip \
      clang \
      gcc \
      gcc-multilib \
      g++-multilib \
      gcovr \
      lcov \
      git \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN pip3 install meson
