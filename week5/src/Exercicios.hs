module Exercicios where

import qualified Data.List   as L
import           Definitions
import           Interpreter

-- MONOIDE
data Resultado
  = Pontuacao Int
  | Cola
  deriving (Show, Eq)

data Set a =
  Set [a]
  deriving (Eq)

fromList :: Ord a => [a] -> Set a
fromList = undefined

member :: Ord a => a -> Set a -> Bool
member = undefined

insert :: Ord a => a -> Set a -> Set a
insert = undefined

delete :: Ord a => a -> Set a -> Set a
delete = undefined

data Dieta
  = Vegano
  | Vegetariano
  | Tradicional
  deriving (Show, Eq)

data Lanche =
  Lanche (Set String) Int Dieta
  deriving (Show, Eq)

-- LAMBDA
null_, nil, cons, head_, tail_ :: LambdaExpr
null_ = Lambda "l" $
  apply2 (Var "l") (Lambda "h" $ Lambda "t" $ Lambda "d" false) true

nil = undefined

cons = undefined

head_ = undefined

tail_ = undefined

listOfIntToChurch :: [Int] -> LambdaExpr
listOfIntToChurch = undefined

runListOfInt :: LambdaExpr -> [Int]
runListOfInt = undefined

at :: LambdaExpr
at = undefined

filter_ :: LambdaExpr
filter_ = undefined
