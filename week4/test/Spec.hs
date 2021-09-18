import           Data.Char        (isUpper)
import           Exercicios
import           Test.Tasty
import           Test.Tasty.HUnit

main :: IO ()
main = do
  defaultMain tests

tests :: TestTree
tests =
  (testGroup "Semana 4" [test01, test02, test03, test04, test05, test06, test07])

test01 =
  testGroup
    "Ex01"
    [ testCase "10 6 3" (assertEqual "" True (ehTriangulo 10 6 13))
    , testCase "12 6 6" (assertEqual "" False (ehTriangulo 12 6 6))
    , testCase "6 6 12" (assertEqual "" False (ehTriangulo 6 6 12))
    , testCase "6 12 6" (assertEqual "" False (ehTriangulo 6 12 6))
    , testCase "23 47 92" (assertEqual "" False (ehTriangulo 23 47 92))
    , testCase "16 20 30" (assertEqual "" True (ehTriangulo 16 20 30))
    , testCase "20 15 30" (assertEqual "" True (ehTriangulo 20 15 30))
    , testCase
        "13.4 17.2 11.1, floats"
        (assertEqual "" True (ehTriangulo (13.4 :: Float) 17.2 11.1))
    , testCase
        "13.4 17.2 11.1, doubles"
        (assertEqual "" True (ehTriangulo (13.4 :: Double) 17.2 11.1))
    ]

test02 =
  testGroup
    "Ex02"
    [ testCase
        "10 6 3"
        (assertEqual "" "Escaleno" (show $ determinaTriangulo 10 6 13))
    , testCase
        "12 6 6"
        (assertEqual "" "Nenhum" (show $ determinaTriangulo 12 6 6))
    , testCase
        "6 6 12"
        (assertEqual "" "Nenhum" (show $ determinaTriangulo 6 6 12))
    , testCase
        "6 12 6"
        (assertEqual "" "Nenhum" (show $ determinaTriangulo 6 12 6))
    , testCase
        "23 47 92"
        (assertEqual "" "Nenhum" (show $ determinaTriangulo 23 47 92))
    , testCase
        "16 20 30"
        (assertEqual "" "Escaleno" (show $ determinaTriangulo 16 20 30))
    , testCase
        "20 15 30"
        (assertEqual "" "Escaleno" (show $ determinaTriangulo 20 15 30))
    , testCase
        "4 3 3"
        (assertEqual "" "Isosceles" (show $ determinaTriangulo 4 3 3))
    , testCase
        "3 4 3"
        (assertEqual "" "Isosceles" (show $ determinaTriangulo 3 4 3))
    , testCase
        "3 3 4"
        (assertEqual "" "Isosceles" (show $ determinaTriangulo 3 3 4))
    , testCase
        "5 5 5"
        (assertEqual "" "Equilatero" (show $ determinaTriangulo 5 5 5))
    , testCase
        "13.4 17.2 11.1, floats"
        (assertEqual
           ""
           "Escaleno"
           (show $ determinaTriangulo (13.4 :: Float) 17.2 11.1))
    , testCase
        "13.4 17.2 11.1, doubles"
        (assertEqual
           ""
           "Escaleno"
           (show $ determinaTriangulo (13.4 :: Double) 17.2 11.1))
    ]

sh a b =
  show $ somarHorario (read $ "HoraMinuto " <> a) (read $ "HoraMinuto " <> b)

test03 =
  testGroup
    "Ex03"
    [ testCase
        "01h00 + 01h00 = 02h00"
        (assertEqual "" "HoraMinuto 2 0" (sh "1 0" "1 0"))
    , testCase
        "01h15 + 01h15 = 02h30"
        (assertEqual "" "HoraMinuto 2 30" (sh "1 15" "1 15"))
    , testCase
        "01h30 + 01h30 = 03h00"
        (assertEqual "" "HoraMinuto 3 0" (sh "1 30" "1 30"))
    , testCase
        "01h30 + 01h30 = 03h00"
        (assertEqual "" "HoraMinuto 3 0" (sh "1 30" "1 30"))
    , testCase
        "01h40 + 01h40 = 03h20"
        (assertEqual "" "HoraMinuto 3 20" (sh "1 40" "1 40"))
    , testCase
        "07h55 + 03h55 = 11h50"
        (assertEqual "" "HoraMinuto 11 50" (sh "7 55" "3 55"))
    ]

hToP x = show $ horarioToPeriodo (read $ "HoraMinuto " <> x)

test04 =
  testGroup
    "Ex04"
    [ testCase "00h00 = Madrugada" (assertEqual "" "Madrugada" (hToP "0 0"))
    , testCase "02h00 = Madrugada" (assertEqual "" "Madrugada" (hToP "2 0"))
    , testCase "05h59 = Madrugada" (assertEqual "" "Madrugada" (hToP "5 59"))
    , testCase "06h00 = Manha" (assertEqual "" "Manha" (hToP "6 0"))
    , testCase "08h00 = Manha" (assertEqual "" "Manha" (hToP "8 0"))
    , testCase "11h59 = Manha" (assertEqual "" "Manha" (hToP "11 59"))
    , testCase "12h00 = Tarde" (assertEqual "" "Tarde" (hToP "12 0"))
    , testCase "14h00 = Tarde" (assertEqual "" "Tarde" (hToP "14 0"))
    , testCase "17h59 = Tarde" (assertEqual "" "Tarde" (hToP "17 59"))
    , testCase "18h00 = Noite" (assertEqual "" "Noite" (hToP "18 0"))
    , testCase "20h00 = Noite" (assertEqual "" "Noite" (hToP "20 0"))
    , testCase "23h59 = Noite" (assertEqual "" "Noite" (hToP "23 59"))
    ]

test05 =
  testGroup
    "Ex05"
    [ testCase "True == True" (assertEqual "" True (toBool True))
    , testCase "False == False" (assertEqual "" False (toBool False))
    , testCase "0 == False" (assertEqual "" False (toBool (0 :: Int)))
    , testCase "1 == True" (assertEqual "" True (toBool (1 :: Int)))
    , testCase "-1 == True" (assertEqual "" True (toBool (-1 :: Int)))
    , testCase "0.0f == False" (assertEqual "" False (toBool (0 :: Float)))
    , testCase "-0.0f == False" (assertEqual "" False (toBool (-0.0 :: Float)))
    , testCase "1.0f == True" (assertEqual "" True (toBool (1 :: Float)))
    , testCase "-1.0f == True" (assertEqual "" True (toBool (-1 :: Float)))
    , testCase "\"\" == False" (assertEqual "" False (toBool ("")))
    , testCase "\"0\" == False" (assertEqual "" False (toBool ("0")))
    , testCase "\" \" == True" (assertEqual "" True (toBool (" ")))
    , testCase "\"Batata\" == True" (assertEqual "" True (toBool ("Batata")))
    , testCase "[] == False" (assertEqual "" False (toBool ([] :: [Int])))
    , testCase "[0] == True" (assertEqual "" True (toBool ([0] :: [Int])))
    , testCase "[1,2] == True" (assertEqual "" True (toBool ([1, 2] :: [Int])))
    ]

cvt t f v = converter (read t) (read f) v

assertClose expected actual =
  assertBool
    ("floats do not match: " <> show expected <> " !== " <> show actual)
    (abs (expected - actual) < 1e-11)

test06 =
  testGroup
    "Ex06"
    [ testCase
        "1 Palmo = 9 Polegadas"
        (assertClose 9 (cvt "Palmo" "Polegada" 1))
    , testCase "1 Pe = 12 Polegadas" (assertClose 12 (cvt "Pe" "Polegada" 1))
    , testCase "1 Pe = 4/3 Palmos" (assertClose (4 / 3) (cvt "Pe" "Palmo" 1))
    , testCase
        "1 Jarda = 36 Polegadas"
        (assertClose 36 (cvt "Jarda" "Polegada" 1))
    , testCase "1 Jarda = 4 Palmos" (assertClose 4 (cvt "Jarda" "Palmo" 1))
    , testCase "1 Jarda = 3 Pes" (assertClose 3 (cvt "Jarda" "Pe" 1))
    , testCase
        "1 Milha = 63360 Polegadas"
        (assertClose 63360 (cvt "Milha" "Polegada" 1))
    , testCase
        "1 Milha = 7040 Palmos"
        (assertClose 7040 (cvt "Milha" "Palmo" 1))
    , testCase "1 Milha = 5280 Pes" (assertClose 5280 (cvt "Milha" "Pe" 1))
    , testCase
        "1 Milha = 1760 Jardas"
        (assertClose 1760 (cvt "Milha" "Jarda" 1))
    , testCase
        "1 Polegada = 1/9 Palmos"
        (assertClose (1 / 9) (cvt "Polegada" "Palmo" 1))
    , testCase
        "27 Polegadas = 9/4 Pes"
        (assertClose (9 / 4) (cvt "Polegada" "Pe" 27))
    , testCase
        "84.14 Palmos = 63.105 Pes"
        (assertClose (63.105) (cvt "Palmo" "Pe" 84.14))
    ]

grego n modo = show $ gerarModo n (read modo)

test07 =
  testGroup
    "Ex07"
    [ testCase
        "8 - Jonio"
        (assertEqual "" "[Do,Re,Mi,Fa,Sol,La,Si,Do]" (grego 8 "Jonio"))
    , testCase
        "8 - Dorico"
        (assertEqual "" "[Re,Mi,Fa,Sol,La,Si,Do,Re]" (grego 8 "Dorico"))
    , testCase
        "8 - Frigio"
        (assertEqual "" "[Mi,Fa,Sol,La,Si,Do,Re,Mi]" (grego 8 "Frigio"))
    , testCase
        "8 - Lidio"
        (assertEqual "" "[Fa,Sol,La,Si,Do,Re,Mi,Fa]" (grego 8 "Lidio"))
    , testCase
        "8 - Mixolidio"
        (assertEqual "" "[Sol,La,Si,Do,Re,Mi,Fa,Sol]" (grego 8 "Mixolidio"))
    , testCase
        "8 - Eolio"
        (assertEqual "" "[La,Si,Do,Re,Mi,Fa,Sol,La]" (grego 8 "Eolio"))
    , testCase
        "8 - Locrio"
        (assertEqual "" "[Si,Do,Re,Mi,Fa,Sol,La,Si]" (grego 8 "Locrio"))
    , testCase
        "80 - Jonio"
        (assertEqual
           ""
           "[Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi]"
           (grego 80 "Jonio"))
    , testCase
        "1600 - Eolio"
        (assertEqual
           ""
           "[La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re,Mi,Fa,Sol,La,Si,Do,Re]"
           (grego 1600 "Eolio"))
    ]
