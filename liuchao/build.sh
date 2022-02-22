#!/usr/bin/bash
set -xe
LLVM_HOME=$(git rev-parse --show-toplevel)

function compile(){

  pushd $LLVM_HOME
  mkdir -p build && cd build
    cmake -G Ninja ../llvm \
     -DLLVM_ENABLE_PROJECTS=mlir \
     -DLLVM_BUILD_EXAMPLES=ON \
     -DLLVM_TARGETS_TO_BUILD="X86;NVPTX;AMDGPU" \
     -DCMAKE_BUILD_TYPE=Release \
     -DLLVM_ENABLE_ASSERTIONS=ON \
     -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_LLD=ON
  
  popd

}

function build(){
  compile
  pushd $LLVM_HOME/build
    cmake --build . --target check-mlir
  popd
}

if [[ "build" = "$1" ]]; then
  build
fi
