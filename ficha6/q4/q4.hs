

cryptoDo :: [[Char]]  -> [[Char]]
cryptoDo [[]] = ' ' 
cryptoDo (x:xs) | x == ' ' = ' '
                | x >= 'A' && x <= 'Z' = toEnum (fromEnum 'A' + mod ((fromEnum x - fromEnum 'A') + 13) 26)
                | otherwise = toEnum (fromEnum 'a' + mod ((fromEnum x - fromEnum 'a') + 13) 26)
        




main :: IO()
main = do
    l <- getContents 
    putStrLn $ unlines.unwords.unletters $ map cryptoDo (letters.words.lines l)