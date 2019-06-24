module Utility
( bufferLeft, bufferRight, wrap
) where

bufferLeft :: Char -> Int -> String -> String
bufferLeft c w s = if length s < w then bufferLeft c w ([c]++s) else s

bufferRight :: Char -> Int -> String -> String
bufferRight c w s = if length s < w then bufferRight c w (s++[c]) else s

wrap :: Int -> String -> [String]
wrap w s = if length s > w then (take w s) : wrap w (drop w s) else [s]
