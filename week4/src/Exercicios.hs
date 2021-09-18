{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Exercicios where

ehTriangulo :: TipoTriangulo -> Bool
ehTriangulo (TipoTriangulo a b c) | abs (b - c) < a && a < b + c ||
                                    abs (a - c) < b && b < a + c ||
                                    abs (a - b) < c && c < a + b = True
                                   |otherwise = False
data TipoTriangulo = TipoTriangulo Int Int Int
  deriving (Show)

determinaTriangulo :: TipoTriangulo -> String
determinaTriangulo (TipoTriangulo a b c) | not $ ehTriangulo (TipoTriangulo a b c) = "Não é possivel construir um Triângulo"
                                         | a == b && a == c = "Equilátero"
                                         | a == b && a /= c ||
                                           b == c && c /= a ||
                                           c == a && b /= c = "Isósceles"
                                         | otherwise = "Escaleno" 
                                        

data Horario = HoraMinuto Int Int
  deriving (Show, Read)

somarHorario :: Horario -> Horario -> Horario 
somarHorario (HoraMinuto h m)  = HoraMinuto (h + (m mod 60)) ()

data Periodo =
  DummyPeriodo
  deriving (Show)

horarioToPeriodo = undefined

data Medida =
  DummyMedida
  deriving (Show, Read)

converter = undefined

data Nota =
  DummyNota
  deriving (Show)

data ModoGrego =
  DummyModoGrego
  deriving (Show, Read)

gerarModo = undefined
