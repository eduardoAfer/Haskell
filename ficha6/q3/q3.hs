putStrLines :: [String] -> IO()
putStrLines [] = return ()
putStrLines (x:xs) = do
    putStrLn x
    putStrLines xs


main :: IO()
main = do
    l <- getContents
    
    putStrLines $ map reverse (lines l)
