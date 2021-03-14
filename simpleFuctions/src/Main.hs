module Main where


tamanho :: [a] -> Int
tamanho [] = 0;
tamanho (_:xs) = 1 + tamanho xs

impar :: Integral a => a -> Bool
impar n = mod n 2 == 1

quadrado :: Num a => a -> a
quadrado n = n*n

quadradoMais6Mod9 :: Integral a => a -> a
quadradoMais6Mod9 n = mod (quadrado n + 6) 9


testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = (a + b) > c &&  (a + c) > b && (b + c) > a


areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt(s*(s - a)*(s - b)*(s -c))
  where s = (a + b + c)/2 :: Float


raiz2GrauV2 :: Floating  a => a -> a -> a -> (a, a)
raiz2GrauV2 a b c = (x1, x2)
  where
   x1      = ((-b) + sqDelta) / (2*a)
   x2      = ((-b) - sqDelta) / (2*a)
   sqDelta = sqrt delta
   delta   = b^(2 :: Int) - 4*a*c

mult :: Integer -> Integer -> Integer
mult = \x y -> (*) x y




myLast :: [a] -> [a]
myLast l = drop (length l - 1) l

myInit :: [a] -> [a]
myInit l = take (length l - 1) l

max :: (Ord a, Num a) => a -> a -> a
max x y = if x >= y then x else y

soma :: Num a => a -> a -> a
soma = \x y -> x + y


main :: IO ()
main = do
  putStrLn "hello world"
