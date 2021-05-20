elefantes :: Int -> IO ()
elefantes 0 = return();
elefantes n =  
    auxElefantes n 2




auxElefantes :: Int -> Int -> IO()

auxElefantes n m |n < m = return()
                 |n > m  && mod m 2 == 0 = do
                            putStrLn ("Se " ++ show m ++ " incomodam muita gente")
                            auxElefantes n (m + 1)
                 |n > m  && odd m = do
                            putStrLn (show m ++ " incomodam muito mais" )
                            auxElefantes  n (m + 1)
                 |otherwise = return()                         


main :: IO ()
main = do
    l <- getLine
    let x = read l :: Int  
    elefantes x
