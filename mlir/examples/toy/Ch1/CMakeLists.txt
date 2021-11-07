# For a better template to copy, see examples/standalone
add_subdirectory(include)
set(LLVM_LINK_COMPONENTS
  Support
  )

add_toy_chapter(toyc-ch1
  toyc.cpp
  mlir/Dialect.cpp
  mlir/MLIRGen.cpp
  parser/AST.cpp

  DEPENDS
  ToyDialectIncGen
  
  )
include_directories(include/)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include/)
target_link_libraries(toyc-ch1
  PRIVATE
  MLIRAnalysis
  MLIRIR
  MLIRParser
  MLIRSideEffectInterfaces
  MLIRTransforms)
