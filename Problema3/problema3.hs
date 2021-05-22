{-# LANGUAGE NamedFieldPuns #-}
import Log

parseMessage :: String -> LogEntry
parseMessage l =  categorizaLog $ words l


categorizaLog :: [String] -> LogEntry
categorizaLog (x:xs) | x == "I" = LogMessage Info (read(head xs)) (unwords(tail xs))
                     | x == "W" = LogMessage  Warning (read(head xs)) (unwords(tail xs))
                     | x == "E" = LogMessage (Error (read(head xs))) (read(head(tail xs))) (unwords(tail(tail xs)))
                     | otherwise = Unknown (unwords (x:xs))


parseLog :: String -> [LogEntry]
parseLog txt = map parseMessage (lines txt)


insert :: LogEntry -> MessageTree -> MessageTree
insert log Empty = Node log Empty Empty  
insert log (Node a esq dir)
  | Unknown  = Node a esq dir
	| aux log  == a = Node a esq (insert log dir)
	| aux log  < a = Node a (insert log esq) dir
	| aux log  > a = Node a esq (insert log dir)

aux :: LogEntry -> Int
aux log = TimeStamp




main :: IO()
main = do
  txt <- readFile "error.log"
  putStrLn $ parseLog txt
