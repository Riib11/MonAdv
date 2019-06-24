module Main where

import           Control.Monad
import           Control.Monad.Trans
import           Control.Monad.Trans.State
import           Interface
import           Update
import           World

main :: IO ()
main = do
  putStrLn "=========================="
  putStrLn "|    +    MonAdv    +    |"
  putStrLn "=========================="

  void $ runStateT loop initWorld

-- game loop

loop :: Update ()
loop = do
  -- execute command
  cmd <- lift getCommand
  case cmd of
    Help       -> lift . putStrLn $ "no one can help you"
    Invalid ws -> lift . putStrLn $ "invalid command: " ++ show ws
    Quit       -> do
      lift . putStrLn $ "quiting MonAdv..."
      modify (\world -> world { running = False })

  -- loop if running
  running <- gets running
  when running loop
