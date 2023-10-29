add x y = x + y

myDrop :: Integer -> [a] -> [a]
myDrop n xs = if n <= 0 || null xs then xs else myDrop (n-1) (tail xs)

lastButOne xs = if length xs < 2
    then head []
    else head (drop ((length xs) - 2) xs)
