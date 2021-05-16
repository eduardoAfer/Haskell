import Log

parseMessage :: String -> LogEntry
parseMessage l =  categorizaLog $ words l 


categorizaLog :: [String] -> LogEntry
categorizaLog (x:xs) | x == "I" = LogMessage Info read(head xs) unwords(tail xs)
                     | x == "W" = LogMessage  Warning read(head xs) unwords(tail xs)
                     | x == "E" = LogMessage (Error read.head xs) read(head(tail xs)) unwords(tail(tail xs))
                     | otherwise = Unknown unwords (x:xs)


parseLog :: String -> [LogEntry]
parseLog txt = map parseMessage (lines txt)






main :: IO()
main = do
  texto <- readFile "error.log"
  parseLog texto
