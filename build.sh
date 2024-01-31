#!/bin/sh
set -eu

cmake -B build -G Ninja \
	-S llvm-project/llvm \
	-DBUILD_SHARED_LIBS=OFF \
	-DCMAKE_INSTALL_PREFIX=$PWD/install \
	-DCMAKE_BUILD_TYPE=MinSizeRel \
	-C $PWD/theos.cmake
ninja -C build install/strip

