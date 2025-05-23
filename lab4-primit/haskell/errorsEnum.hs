module Main where

import System.IO (hSetBuffering, stdout, BufferMode(..))

main =
    do
    initialiseIO
    putStrLn ("known results = " ++ show allErrors)
    result <- getElement "result"
    putStrLn (show result ++ " comes from: " ++ show (error2Result result))
    
initialiseIO =
    do
    hSetBuffering stdout NoBuffering
        -- ensure any console output is shown asap

data Error = FP_Rounding | FP_Overflow | FP_Underflow | Int_Overflow
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)
data Result = Zero | Infinity | ABitDifferent | VeryDifferent
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)

allErrors :: [Result] -- ie it is a list of PL elements
allErrors = [minBound .. maxBound]

error2Result ABitDifferent = FP_Rounding
error2Result Infinity = FP_Overflow
error2Result Zero = FP_Underflow
error2Result VeryDifferent = Int_Overflow

-- The code below should not be changed and does not need to be fully understood.

{-
  `getElement'
  queries the user for one element until the user types something 
  that can be interpreted as the correct type of element (eg integer)
-}
getElement elementTypeName =
    do
    hSetBuffering stdout NoBuffering -- print to console in real time, not in batches
    putStr ("Input one " ++ elementTypeName ++ ": ") -- print the prompt
    line <- getLine -- get whatever user types as a string
    case parseElement line of
         Just element -> 
            do
            return element
         Nothing -> 
            do
            putStrLn ("Invalid " ++ elementTypeName ++ ", try again")
            getElement elementTypeName -- try again - using recursion

parseElement line =
    case reads line of
        [] -> -- no valid interpretation of the line as an element ([] = the empty list)
            Nothing
        -- [pattern 2:]
        ((e,_) : _) -> -- found at least one interpretation, call it "e"
            Just e -- type of e is derived from context
                   -- where getElement is used
