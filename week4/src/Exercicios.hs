{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Exercicios where

 ehTriangulo :: (Num a, Ord a) => a -> a -> a -> Bool
 ehTriangulo  a b c = abs (b - c) < a && a < b + c ||
                      abs (a - c) < b && b < a + c ||
                      abs (a - b) < c && c < a + b 
                    

data TipoTriangulo = Escaleno | Isosceles | Equilatero | Nenhum
  deriving (Show)

determinaTriangulo :: (Num a, Ord a) -> a -> a -> a -> TipoTriangulo 
determinaTriangulo  a b c 
                     | a == b && a == c = Equilátero
                     | a == b && a /= c ||
                       b == c && c /= a ||
                       c == a && b /= c = Isósceles
                     | otherwise = Escaleno 
                                    

data Horario = HoraMinuto Int Int
  deriving (Show, Read)

somarHorario :: Horario -> Horario -> Horario 
somarHorario (HoraMinuto h m) (HoraMinuto h2 m2) | m + m2 >= 60  = HoraMinuto (h + h2 + a + b) (mod m 60)
                                                 | otherwise = HoraMinuto (h + h2) (m + m2)
  where minToHora_1 = div m 60
        minToHora_2 = div m2 60                                         




data Periodo = Madrugada | Manha | Tarde | Noite
  deriving (Show)

horarioToPeriodo :: Horario -> Periodo
horarioToPeriodo h m | h >= 0 && h <= 5 && m >= 0 && m <= 59 = Madrugada
                     | h >= 6 && h <= 11 && m >= 0 && m <= 59 = Manha
                     | h >= 12 && h <= 17 && m >= 0 && m <= 59 = Tarde
                     | otherwise = Noite


class Booleable a where
  toBool :: a -> Bool

instance Booleanable Bool where
  toBool  =  id --  equal to toBool b =  b


instance Booleanable Int where
  toBool i = i /= 0 -- equal to toBool = (/=) 0


instance Booleanable Float where
  toBool f = f /= 0 &&  not (isNegativeZero f)


instance Booleanable String where
  toBool s = not (null s) && s /= "0"

instance Booleanable [Int] where
  toBool = not . null


data Medida = Polegada | Palmo | Pe | Jarda | Milha
   deriving (Show, Read, Ord) -- o Ord vai automaticamente efetuar a representação de maior para menor nos construtores

fatorConversao :: Fractional a => Medida -> Medida -> a
fatorConversao de       para     | de    para = recip $ fatorConversao para de
fatorConversao Polegada Polegada = 1
fatorConversao Palmo    Polegada = 9
fatorConversao Pe       Polegada = 12
fatorConversao Jarda    Polegada = 36
fatorConversao Milha    Polegada = 63360


converter ::Fractional a => Medida -> Medida -> a -> a
converter de para x = x * fatorConversao de Polegada * fatorConversao Polegada para

data Nota = Do | Re | Mi | Fa | Sol | La | Si 
  deriving (Show, Enum)

data ModoGrego = Jonio | Dorico | Frigio | Lidio | Mixolidio | Eolio | Locrio
  deriving (Show, Read, Enum)

gerarModo :: Int -> ModoGrego -> [Nota]
gerarModo n modo = drop (fromEnum modo) $ repeat (Do.. Si)

