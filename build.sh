#!/bin/sh

clear

# set -ex

if [ -d build ]; then rm -rf build; fi
# https://learn.microsoft.com/en-us/vcpkg/users/buildsystems/cmake-integration
cmake -S . -B build -GNinja -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT"/scripts/buildsystems/vcpkg.cmake
# cmake -S . -B build -GNinja
(cd build || exit; ninja)
