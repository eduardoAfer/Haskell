module Main where



calculaMinutos :: Int -> Int -> Int
calculaMinutos m1 m2
        | m1 > m2 = (60 + m2) - m1
        |otherwise = m2 - m1

horasParaMinutos ::  Int -> Int -> Int -> Int -> Int
horasParaMinutos h1 m1 h2 m2 = x
    where
        a = h1*60 + m1
        b = h2*60 + m2
        x = b - a



calculaHoras ::  Int -> Int -> Int -> Int -> Int 
calculaHoras h1 m1 h2 m2 = x
    where 
        a = h1*60 + m1
        b = h2*60 + m2
        x = (b - a) `div` 60

--função principal
dialogo :: Int -> Int -> Int -> Int -> (String, String)
dialogo h1 m1 h2 m2
        | horasParaMinutos h1 m1 h2 m2 `mod` 60 == 0 && horasParaMinutos h1 m1 h2 m2 `div` 60 == 1 = ("Passaram apenas " ++ show a ++  " minutos!" , "Queres dizer, " ++ show d ++ " hora?!")
        | horasParaMinutos h1 m1 h2 m2 `mod` 60 == 0 = ("Passaram apenas " ++ show a ++  " minutos!" , "Queres dizer, " ++ show b ++ " horas?!")
        | calculaHoras h1 m1 h2 m2 == 0 && calculaMinutos m1 m2 == 1 = ("Passou apenas " ++ show a ++ " minuto!" , "De facto!")
        | calculaHoras h1 m1 h2 m2 == 0 && calculaMinutos m1 m2 == 1 = ("Passaram apenas " ++ show a ++ " minutos!" , "De facto!")
        | calculaHoras h1 m1 h2 m2 == 0 = ("Passaram apenas " ++ show a ++ " minutos!" , "De facto!")
        | calculaMinutos m1 m2 == 1 && calculaHoras h1 m1 h2 m2 == 1 = ("Passaram apenas " ++ show a ++  " minutos!" , "Queres dizer, " ++ show b ++ " hora e "++ show c ++ " minuto?!")
        | calculaHoras h1 m1 h2 m2 > 1 && calculaMinutos m1 m2 == 1 = ("Passaram apenas " ++ show a ++  " minutos!" , "Queres dizer, " ++ show b ++ " horas e "++ show c ++ " minuto?!")
        | calculaHoras h1 m1 h2 m2 == 1 && calculaMinutos m1 m2 > 1 = ("Passaram apenas " ++ show a ++  " minutos!" , "Queres dizer, " ++ show b ++ " hora e "++ show c ++ " minutos?!")
        | calculaMinutos m1 m2 == 1 = ("Passaram apenas " ++ show a ++  " minutos!" , "Queres dizer, " ++ show b ++ " horas e "++ show c ++ " minuto?!")
        | otherwise = ("Passaram apenas " ++ show a ++  " minutos!", "Queres dizer, " ++ show b ++ " horas e "++ show c ++ " minutos?!")
    where
        a = horasParaMinutos h1 m1 h2 m2
        b = calculaHoras h1 m1 h2 m2
        c = calculaMinutos m1 m2
        d = horasParaMinutos h1 m1 h2 m2 `div` 60







