module Main where



main :: IO ()
main = do
  l <- getContents 
  putStrLn $ unlines $ map reverse (lines l)
