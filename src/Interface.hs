module Interface
( consoleWidth
, Command(..)
, getCommand
) where

import           Control.Monad.Trans
import           Control.Monad.Trans.State
import           System.IO
import           World

------------------------------------------------------------------------------------------------------------------------------
-- constants

consoleWidth :: Int
consoleWidth = 100

------------------------------------------------------------------------------------------------------------------------------
-- command

data Command = Help
             | HelpWith String
             | Query String
             | Quit
             | Invalid [String]

getCommand :: IO Command
getCommand = do
  putStr "> "
  hFlush  stdout
  input <- getLine
  putStrLn ""
  let ws = words input
  return $ case ws of
    -- help
    ["help"]     -> Help
    ["help", x]  -> HelpWith x
    -- query
    ["query", x] -> Query x
    -- quit
    ["quit"]     -> Quit
    -- invalid command
    ws           -> Invalid ws
