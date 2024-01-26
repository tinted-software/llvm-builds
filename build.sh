#!/bin/sh
set -eu

LLVM_PROJECT_DIR=${LLVM_PROJECT_DIR:-"llvm-project/llvm"}

cmake -B build -G Ninja \
	-S ${LLVM_PROJECT_DIR} \
	-DBUILD_SHARED_LIBS=OFF \
	-DCMAKE_INSTALL_PREFIX=$PWD/install \
	-DCMAKE_BUILD_TYPE=MinSizeRel \
	-C $PWD/bootstrap.cmake
ninja -C build stage3-install-stripped

