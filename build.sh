#!/bin/sh
set -eu

cmake -B build -G Ninja \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_ASM_COMPILER=clang \
	-S llvm-project/llvm \
	-DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR=$PWD/build/bin \
	-DCMAKE_INSTALL_PREFIX=$PWD/install \
	-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE:-Release} \
	-DPython3_EXECUTABLE=$(which python3) \
	-C $PWD/theos.cmake
ninja -C build install/strip

