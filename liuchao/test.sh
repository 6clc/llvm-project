./build/bin/toyc-ch3 mlir/test/Examples/Toy/Ch2/codegen.toy -emit=mlir -mlir-print-debuginfo
./build/bin/toyc-ch2 mlir/test/Examples/Toy/Ch2/codegen.toy -emit=mlir -mlir-print-debuginfo 2> codegen.mlir
./build/bin/toyc-ch1 liuchao/test.toy -emit=ast

build_root="./build"
mlir_src_root="./mlir"

${build_root}/bin/mlir-tblgen -gen-dialect-decls ${mlir_src_root}/examples/toy/Ch1/include/toy/Ops.td -I ${mlir_src_root}/include/

${build_root}/bin/mlir-tblgen -gen-op-defs  ${mlir_src_root}/examples/toy/Ch1/include/toy/Ops.td -I ${mlir_src_root}/include/
${build_root}/bin/mlir-tblgen -gen-op-decls  ${mlir_src_root}/examples/toy/Ch1/include/toy/Ops.td -I ${mlir_src_root}/include/