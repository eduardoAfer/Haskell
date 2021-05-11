module Main where

inverteLinhas :: [[a]] -> String -> IO()
inverteLinhas = do 
inverteLinhas [[]] = ""
inverteLinhas (x:xs) = reverse x : inverteLinhas xs



main :: IO ()
main = do
  l <- getLine
  inverteLinhas lines l
