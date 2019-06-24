{-# LANGUAGE DuplicateRecordFields #-}

module World
( World(..), initWorld
, Player (..), initPlayer
, Item(..), initInventory
, Location(..), initLocation
, Connection(..)
) where

-- World

data World = World
  { player  :: Player
  , time    :: Int
  , running :: Bool }

initWorld :: World
initWorld = World
  { player = initPlayer
  , time = 0
  , running = True }

-- Player

data Player = Player
  { name :: String
  , loc  :: Location
  , inv  :: [Item] }

initPlayer :: Player
initPlayer = Player "You" initLocation initInventory

-- Item

data Item = Item
  { name :: String
  , desc :: String }

initInventory :: [Item]
initInventory = []

-- Location

data Location = Location
  { name  :: String
  , desc  :: String
  , conns :: [Connection] }

initLocation :: Location
initLocation = Location
  { name  = "Home"
  , desc  = "your home"
  , conns = [] }

data Connection = Connection
  { desc :: String
  , dest :: Location }
