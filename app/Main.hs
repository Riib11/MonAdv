module Main where

import           Control.Monad
import           Control.Monad.Trans
import           Control.Monad.Trans.State
import           Interface
import           Update
import           Utility
import           World

------------------------------------------------------------------------------------------------------------------------------
-- main

main :: IO ()
main = do
  putStrLn "=========================="
  putStrLn "|    +    MonAdv    +    |"
  putStrLn "=========================="

  void $ runStateT loop initWorld

------------------------------------------------------------------------------------------------------------------------------
-- game loop

loop :: Update ()
loop = do
  -- execute command
  cmd <- lift getCommand
  case cmd of
    Help       -> lift . putStrLn $ helpMessage
    Invalid ws -> lift . putStrLn $ "invalid command: " ++ show ws
    Quit       -> do
      lift . putStrLn $ "quiting MonAdv..."
      modify (\world -> world { running = False })

  -- loop if running
  running <- gets running
  when running loop

------------------------------------------------------------------------------------------------------------------------------
-- help

helpMessage =
  bufferRight '=' consoleWidth "+help" ++ "\n" ++
  -- "==help==================================\n" ++
  -- let maxNameLength = max $ map (length . snd) helpTopics
  let f s title body =
        s ++
        (bufferRight ' ' 28 ("| ~ "++title) ++ " : ") ++
        (foldl (\s line -> s++"\n"++(replicate 30 ' ')++s) "" (wrap 20 body)) in
  foldl (\s (title, body) -> s++"| ~ "++title++" : "++body++"\n") "" helpTopics

helpTopics :: [(String, String)]
helpTopics =
  [ ("help", "shows total list of help topics.")
  , ("query", "take a closer look at something.") ]
