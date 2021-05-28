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
insert (Unknown _ ) t = t
insert log Empty = Node log Empty Empty
insert log (Node a esq dir)
        | aux log  < aux a = Node a (insert log esq) dir
        | aux log  >= aux a = Node a esq (insert log dir)

aux :: LogEntry -> Int
aux (LogMessage  Info t _) = t
aux (LogMessage Warning t _) = t
aux (LogMessage (Error _ ) t _ ) = t


build :: [LogEntry] -> MessageTree    -- construir uma árvore ordenada
build xs = foldr (\ x arv -> (insert x arv)) Empty xs



inOrder :: MessageTree -> [LogEntry]  -- listar mensagens por ordem
inOrder Empty = []
inOrder (Node a esq  dir)  = (inOrder esq) ++ [a] ++ (inOrder dir)


sortMessages :: [LogEntry] -> [LogEntry]
sortMessages msgs = inOrder (build msgs)

maiorq50 :: LogEntry -> Bool
maiorq50 l | auxMaior l >= 50 = True 
           | otherwise = False 

auxMaior :: LogEntry -> Int
auxMaior (LogMessage (Error t ) _ _ ) = t


main :: IO()
main = do
  txt <- readFile "error.log"
  putStrLn $ show $ filter maiorq50 (sortMessages (parseLog txt))
