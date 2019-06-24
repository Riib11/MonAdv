module Interface
( Command(..)
, getCommand
) where

import           Control.Monad.Trans
import           Control.Monad.Trans.State
import           System.IO
import           World

data Command = Help
             | HelpWith String
             | Query String
             | QueryItem String
             | QueryLocation String
             | Quit
             | Invalid [String]

getCommand :: IO Command
getCommand = do
  putStr "> "
  hFlush  stdout
  input <- getLine
  let ws = words input
  return $ case ws of
    -- help
    ["help"]                 -> Help
    ["help", x]              -> HelpWith x
    -- query
    ["query", x]             -> Query x
    ["query", "item", x]     -> QueryItem x
    ["query", "location", x] -> QueryLocation x
    -- quit
    ["quit"]                 -> Quit
    -- invalid command
    ws                       -> Invalid ws
