import Data.Char
--module Main where
{--

-- Usando map, crie uma função comprimentoAoQuadrado xs que 
-- recebe uma lista de strings e, como o nome sugere, retorna os 
-- seus comprimentos ao quadrado. Exemplo:
-- comprimentoAoQuadrado ["ola", "mundo"] == [9, 25]

comprimentoAoQuadrado :: [String] -> [Int]
comprimentoAoQuadrado  = map ((^ 2) . length)

-- ==================================================

findLast :: ([a] -> [a]) -> a
findLast f xs = last.f xs


-- ==================================================


gerarUsuarios :: Int -> String -> [String]
gerarUsuarios num str = reverse.gerarUsuariosAux num str

gerarUsuariosAux :: Int -> String -> [String]
gerarUsuariosAux num str | num == 0 = []
                         | otherwise = str ++ show num : gerarUsuariosAux (num - 1) str

-- ===================================================

descontoDaSorte :: [Int] -> [Int]
descontoDaSorte [] = []
descontoDaSorte (x:xs) | (x - 10) mod 7 == 0 = descontoDaSorte xs
                       | otherwise = x - 10 : descontoDaSorte xs
--}
-- ====================================================

limparUsernames :: [String] -> [String]
limparUsernames =  map limparUsernamesAux 
      
limparUsernamesAux :: String -> String
limparUsernamesAux  = filter isAlphaNum

-- ======================================================

maisDaMetade :: (a -> a) -> [a] -> Bool
maisDaMetade f xs = (length.filter f xs) > length xs 


-- ======================================================

palavraMaisLonga :: [String] -> String
palavraMaisLonga (x:xs) = head.palavraMaisLongaAux x xs 

palavraMaisLongaAux :: String -> [String] -> [String]
palavraMaisLongaAux str (_) = [str] 
palavraMaisLongaAux str xs | length str < length.head xs = palavraMaisLongaAux (head xs) (tail xs) 
                           | otherwise = palavraMaisLongaAux str (tail xs)

-- =======================================================




-- main ::  IO ()
-- main = do
--   x <- getLine 
--   y <- words x
--   putStrLn comprimentoAoQuadrado y
  
