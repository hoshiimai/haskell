-- main = do
--   let mmm = maximum' [2, 5, 1]
--   let nnn = maximum' []
--   print mmm

-- maximum' :: (Ord a) => [a] -> a  
-- maximum' [] = error "maximum of empty list"  
-- maximum' [x] = x
-- maximum' (x:xs)
--     | x > maxTail = x
--     | otherwise = maxTail
--     where maxTail = maximum' xs


main = do
  let nnn = quicksort [3,5,2,7,9,1]
  print nnn

quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  