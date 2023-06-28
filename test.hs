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










data ErrorType = AlreadyExistsError
               | DoesNotExistError
               | AlreadyInUseError
               | FullError
               | EOFError
               | IllegalOperation
               | PermissionError
               | UserError
               deriving (Eq, Show)

identifyError :: String -> Maybe ErrorType
identifyError "AlreadyExistsError" = Just AlreadyExistsError
identifyError "DoesNotExistError" = Just DoesNotExistError
identifyError "AlreadyInUseError" = Just AlreadyInUseError
identifyError "FullError" = Just FullError
identifyError "EOFError" = Just EOFError
identifyError "IllegalOperation" = Just IllegalOperation
identifyError "PermissionError" = Just PermissionError
identifyError "UserError" = Just UserError
identifyError _ = Nothing

main :: IO ()
main = do
  putStrLn "Enter an error type:"
  input <- getLine
  case identifyError input of
    Just errorType -> putStrLn $ "Error type identified: " ++ show errorType
    Nothing -> putStrLn "Invalid error type"


