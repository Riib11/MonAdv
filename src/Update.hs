module Update
( Update
) where

import           Control.Monad.Trans
import           Control.Monad.Trans.State
import           Interface
import           World

-- Update

type Update a = StateT World IO a
