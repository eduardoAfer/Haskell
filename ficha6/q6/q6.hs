

readDict :: IO [String]
readDict = do
    txt <- readFile "/usr/share/dict/words"
    return (lines txt)

putStrLnVermenlho :: String -> IO()
putStrLnVermenlho x = putChunkLn x <> b_red



verExistencia :: [String] -> [String] -> IO()
verExistencia _ [] = return()
verExistencia d (x:xs) = do
                     if x `elem` d
                         then  putStrLn x
                     else  putStrLnVermelho x
                     verExistencia d xs


main :: IO()
main = do
    l <- getContents
    d <- readDict
    verExistencia d (words l)


