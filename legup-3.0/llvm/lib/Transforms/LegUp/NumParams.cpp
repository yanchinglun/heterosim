//===- NumParams.cpp - LegUp pre-LTO pass -------------------------===//
//
// This file is distributed under the LegUp license. See LICENSE for details.
//
//===----------------------------------------------------------------------===//
//
// The NumParams pass strips away all accelerated functions including
// those still used in SW part.
//
//===----------------------------------------------------------------------===//

#include "llvm/Pass.h"
#include "llvm/Function.h"
#include "llvm/Module.h"
#include "llvm/Instructions.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "utils.h"
#include <set>

using namespace llvm;

namespace legup {

class NumParams  : public ModulePass {
public:
    static char ID; // Pass identification, replacement for typeid
    NumParams() : ModulePass(ID) {}

    virtual bool runOnModule(Module &F);

private:
};

char NumParams::ID = 0;
static RegisterPass<NumParams> Y("legup-num-params",
        "print out number of arguments for each function");

bool NumParams::runOnModule(Module &M) {
    std::string FileError;
    raw_fd_ostream num_params_rpt ("num_params.legup.rpt", FileError);
    for (Module::iterator F = M.begin(), FE = M.end(); F != FE; ++F) {
        num_params_rpt << F->getNameStr() << ": " << F->arg_size() << " arguments.\n";
    }

    return true;
}

} // end of legup namespace

