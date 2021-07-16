

myElem ::(Eq a, Num a) => a -> [a] -> Bool
myElem _ [] = False
myElem m [x] = m == x
myElem  m (x:xs) = m == head xs || myElem m xs




