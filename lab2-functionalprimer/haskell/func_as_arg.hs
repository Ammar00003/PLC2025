--create inpFunc
a = 5
b = 10
inpFunc = [a..b] 

--Define applicatorFunc
applicatorFunc inpFunc s | s=='s' = sum inpFunc 
                         | otherwise = (sum inpFunc)/(b-a)  

main = do
    let result = applicatorFunc inpFunc 'a' --Call applicatorFunc with inpFunc and 'a' as args
    putStrLn("sum = " ++ show(result))