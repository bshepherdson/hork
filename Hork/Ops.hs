
import Hork.Memory
import Hork.Types
import Hork.Strings
import Hork.Util

import Data.Map
import Data.Word
import Data.Int
import Data.Bits

-- types
data OperandCount = VAR | 2OP | 1OP | 0OP
  deriving (Eq, Ord)
data OperandType = Large | Small | Var | None
  deriving (Eq)


data Opcode = Opcode OperandCount Word8





