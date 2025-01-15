{
  clangStdenv,
  python3,
  cmakeMinimal,
  ninja,
  llvm-project,
}:

clangStdenv.mkDerivation {
  name = "llvm-project";
  version = "trunk";
  src = llvm-project;

  nativeBuildInputs = [
    python3
    cmakeMinimal
    ninja
  ];

  cmakeFlags = [
    "-GNinja"
    "-S../llvm"
    "-DLLVM_TOOL_LLVM_DRIVER_BUILD=ON"
    "-DLLVM_TOOL_REMARKS_SHLIB_BUILD=OFF"
    "-DLLVM_LINK_LLVM_DYLIB=OFF"
    "-DLLVM_BUILD_LLVM_DYLIB=OFF"
    "-DCLANG_ENABLE_HLSL=ON"
    "-DCLANG_ENABLE_CIR=ON"
    "-DLLVM_INSTALL_UTILS=ON"
    "-DMLIR_ENABLE_VULKAN_RUNNER=OFF"
    "-DMLIR_ENABLE_BINDINGS_PYTHON=OFF"
    "-DLLVM_INCLUDE_TESTS=OFF"
    "-DLLVM_ENABLE_TERMINFO=OFF"
    "-DLLDB_ENABLE_LIBEDIT=OFF"
    "-DLLDB_ENABLE_CURSES=OFF"
    "-DLLDB_ENABLE_LIBXML2=OFF"
    "-DLLDB_ENABLE_PYTHON=OFF"
    "-DLLDB_ENABLE_LUA=OFF"
    "-DLLDB_ENABLE_LZMA=OFF"
    "-DLLVM_CCACHE_BUILD=OFF"
    "-DCLANG_DEFAULT_UNWINDLIB=libunwind"
    "-DCLANG_DEFAULT_CXX_STDLIB=libc++"
    "-DCLANG_DEFAULT_LINKER=lld"
    "-DCLANG_DEFAULT_OBJCOPY=llvm-objcopy"
    "-DCLANG_DEFAULT_RTLIB=compiler-rt"
    "-DCLANG_PLUGIN_SUPPORT=ON"
    "-DLLVM_ENABLE_EH=OFF"
    "-DLLVM_ENABLE_RTTI=OFF"
    "-DLLVM_ENABLE_PIC=ON"
    "-DLLVM_ENABLE_LIBXML2=OFF"
    "-DLLVM_ENABLE_PROJECTS=mlir;bolt;polly;libclc;clang;lld;clang-tools-extra;lldb"
    "-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=all"
  ];
}
