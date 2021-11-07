#ifndef TOY_OPS
#define TOY_OPS

include "mlir/IR/OpBase.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def Toy_Dialect : Dialect{
  let name = "toy";
  let cppNamespace = "::mlir::toy";
}

class Toy_Op<string mnemonic, list<OpTrait> traits = []> :
    Op<Toy_Dialect, mnemonic, traits>;


def ConstantOp:Toy_Op<"constant", [Terminator]>{
  let summary = "constant";
  let description = [{ 
    this is constant operation from liuchao.
  }];

  let arguments = (ins
                   F64ElementsAttr:$value);

  let results = (outs
                 F64Tensor);
  
}

// def ReturnOp : Toy_Op<"return", [NoSideEffect, HasParent<"FuncOp">,]>


#endif
