#!/bin/sh

set -e

export SASSC_VERSION=3.3.0
export LIBSASS_VERSION=3.3.2
export SASS_LIBSASS_PATH=/tmp/libsass-${LIBSASS_VERSION}

build_deps="curl g++ make tar"

apk add --update $build_deps

cd /tmp

# Fetch
curl -L https://github.com/sass/libsass/archive/${LIBSASS_VERSION}.tar.gz | tar xvz
curl -L https://github.com/sass/sassc/archive/${SASSC_VERSION}.tar.gz | tar xvz

# Compile
cd /tmp/sassc-$SASSC_VERSION
make STATIC_ALL=1
cp /tmp/sassc-${SASSC_VERSION}/bin/sassc /build/sassc

