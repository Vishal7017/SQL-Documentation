import System.IO

hangman :: IO ()
hangman = do putStrin "Think of a worD:"
             word <- sgetLine
             putString "Try to guess it:"
             play word


sgetLine :: IO String
sgetLine = do x <- getCh
              if x == '\n' then
                do putChar x
                    return []
              else
                do putChar '-'
                xs <- sgetLine
                return (x:xs)

getCh :: IO Char
getCh = do hSetEcho stdin False
           c <- getChar
           hSetEcho stdin True
           return c
        
play :: String -> IO ()
play word = do putStr "? "
             guess <- getLine
             if guess == word then  
                putStrin "You got it!!"
            else
                do putStrin (match word guess)
                    play word
                
match :: String -> String -> String
match xs ys = [if elem x ys then x else '-' | x <- xs]

