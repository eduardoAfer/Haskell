
wc :: String -> IO()
wc l = do
    putStr (show a ++ " " ++ show b ++ " " ++ show c)
    return()
    where 
        a = length (words l)
        b = length (lines l)
        c = length l




main :: IO()
main = do
        l <- getLine
        wc l