--------------------------------------------------------------------------------------
Vishal Wavhale
Class Number : 590
--------------------------------------------------------------------------------------
--Q1:

--(a)
isPrime :: Integer -> Bool
isPrime n
    | n <= 1 = False
    | otherwise = all (\x -> n `mod` x /= 0) [2..isqrt n]
    where isqrt = floor . sqrt . fromIntegral

almostprime :: Integer -> Bool
almostprime n
    | n <= 1 = False
    | otherwise =
        let primes = [p | p <- [2..n], isPrime p]
        in any (\p -> isPrime (n `div` p) && n `div` p /= p) primes

main :: IO ()
main =  do
print(almostprime 6)
print(almostprime 9)

-------------------------------------------------------------------------------------

--(b)
{-
--Reveiwing based on my coding
(i)
The Caesar cipher a straightforward encryption technique shifts characters within the alphabet by a designated number of positions. Within this implementation, the encode function accepts a string and a shift factor as inputs. It then displaces each character in the string by the specified factor to produce the encoded message. To simplify operations, the let2int and int2let functions convert characters to integers and vice versa. Managing the logic of character shifting, the shift function ensures accurate encryption.
(ii)
--To crack the cipher
Cracking entails analyzing the frequency of letters in the encoded message and contrasting it with the anticipated distribution of letter frequencies in English. The crack function seeks the accurate shift factor by minimizing the chi-square statistic, comparing observed and expected frequencies through different rotations. The freqs function calculates letter frequencies in a provided string. Managing rotations for various shifts, the rotate function handles list entries, while the chisqr function computes the chi-square statistic.
(iii)

--review on list comprehension experience through implementing ceaser cipher

The provided implementation of the Caesar cipher offers a lucid and effective demonstration of utilizing Haskell to create a fundamental encryption technique. This code serves as a valuable educational resource for understanding cryptography and Haskell programming techniques, elucidating fundamental concepts such as character manipulation, frequency analysis, and list comprehension.
List comprehension plays a pivotal role in the encode, frequency, and crack functions within this implementation. Let's delve deeper into list comprehension and its impact on the entirety of the implementation.

The encode function employs list comprehension to apply a shift to each character in the input string, highlighting its versatility. Utilizing the shift function, it iterates through the characters, rendering the encoding process succinct and comprehensible.

To decipher the Caesar cipher, analyzing the frequency of lowercase letters in a string is essential, facilitated by the freqs function. List comprehension efficiently generates the frequency table, showcasing its effectiveness in simplifying data transformations and computations.

In the crack function, list comprehension aids in examining the distribution of letter frequencies to decode the encoded data. While statistical analysis is pivotal in the cracking method, list comprehension expedites the generation of chi-square values for various rotations, aiding in determining the shift factor required to decode the message.

In essence, the Caesar cipher implementation benefits significantly from the expressive and efficient nature of list comprehension in Haskell. It enables the code to perform intricate data processing tasks, frequency computations, and character alterations effectively and elegantly. Leveraging list comprehension effectively ensures the implementation remains concise while illustrating key concepts of Haskell functional programming and cryptography.
=============================================================================================================================================================================================================================================================================================================================
-}
--Q2:


--(a)
-- Defining the Prop1 datatype for propositional formulas with ∨ (OR) connective
data Prop1 = Const1 Bool        -- Represents a constant value (True or False)
           | Var1 Char            -- Represents a variable (e.g., 'A', 'B')
           | Not1 Prop1           -- Represents negation
           | And1 Prop1 Prop1     -- Represents logical AND
           | Or Prop1 Prop1       -- Represents logical OR (newly added for Prop1)


--(b)         

-- Defining the Prop datatype for reference
data Prop = Const Bool
          | Var Char
          | Not Prop
          | And Prop Prop
          


-- Transform function
transform :: Prop1 -> Prop
transform (Const1 b) = Const b
transform (Var1 c) = Var c
transform (Not1 p) = Not (transform p)
transform (And1 p q) = And (transform p) (transform q)
transform (Or p q) = Not (And (Not (transform p)) (Not (transform q)))  


main :: IO ()
main = do
  putStrLn "Original Prop1 formula:"
  print sampleProp1
  putStrLn "Transformed Prop formula:"
  print (transform sampleProp1)


===================================================================================================================================================

--Q3:

(a)
type PName = String

data Prin = Name PName
          | Together Prin Prin
          | Quote Prin Prin
          deriving (Eq, Show)

you :: Prin
you = Name "You"

me :: Prin
me = Name "Me"

him :: Prin
him = Name "Him"

-- pexp1: (You & Me)
pexp1 :: Prin
pexp1 = Together you me

-- pexp2: (You | (Me & Him))
pexp2 :: Prin
pexp2 = Quote you (Together me him)

(b)

-- Now implementing isSimple

 isSimple :: [(Prin, a)] -> Bool
 isSimple = all isSimpleName . map fst
   where
     isSimpleName :: Prin -> Bool
     isSimpleName (Name _) = True
     isSimpleName _ = False


=============================================================================================================================================================


--Q4

{-

An integral concept within access control methodologies revolves around the "Ticket Rule," which sets forth guidelines and permissions for accessing protected resources under specific conditions. To ensure the credibility and legitimacy of access requests, it involves a systematic sequence of logical procedures.

Essentially, the Ticket Rule comprises the following fundamental components:

    Access Policy: This determines which entities have the authorization to perform specific actions on objects and governs access privileges.
    Trust Assumption: Central to this is the assumption that tickets or identifications issued by authorities are genuine and represent the subject's authorization.
    Ticket Validation: The validity of a ticket confirms that its holder is authorized to perform or access particular activities or items.
    Access Request: Individuals submit access requests, typically specifying the task or activity they intend to undertake.

Access control systems effectively manage access rights by adhering to the logical flow dictated by the Ticket Rule. As per this protocol, a subject's access request is granted if they furnish a valid ticket and adhere to relevant access policies. The verification process involves scrutinizing the authority's certification of the subject's entitlement to the requested activity based on the presented ticket.

In real-world scenarios such as airline boarding, the Ticket Rule ensures that only passengers possessing legitimate boarding permits (tickets) issued by the airline (authority) can board the aircraft at the designated time. This methodical approach enhances security, prevents unauthorized access attempts, and instills confidence in access control systems.

In summary, the Ticket Rule embodies a comprehensive approach to access control, emphasizing the importance of authorization, credential reliability, and adherence to access restrictions. This serves to safeguard sensitive resources and uphold system integrity.
-}


============================================================================================================================================================

-- Caesar Cipher Implementation

import Data.Char

-- function used to count no. of lower case letters
lowers :: String -> Int
lowers xs = length [x | x <- xs, isLower x]

-- The let2int function converts corresponding letter to it's index i.e. c to 3
let2int :: Char -> Int
let2int c = ord c - ord 'a'

-- The int2let function converts corresponding integer or index to letter i.e. 5 to e
int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

-- shifting letters by given factor
shift :: Int -> Char -> Char
shift n c
  | isLower c = int2let ((let2int c + n) `mod` 26)
  | otherwise = c

-- final encoding for all the functions
encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- percentage of occurences the
percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100

-- frequencies
freqs :: String -> [Float]
freqs xs = [percent (count x xs) n | x <- ['a'..'z']]
  where
    count x xs = length [c | c <- xs, c == x]
    n = lowers xs

-- rotating list by n places
rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

-- calculating chi-square statistic given in text book
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o - e) ^ 2) / e | (o, e) <- zip os es]

-- cracking cipher
crack :: String -> String
crack xs = encode (-factor) xs
  where
    factor = head (positions (minimum chitab) chitab)
    table' = freqs xs
    chitab = [chisqr (rotate n table') table' | n <- [0..25]]


positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..], x == x']



main :: IO ()
main =  do
print(encode 3 "haskell is functionall programming language")
print(crack "kdvnhoo lv ixq")

[1 of 1] Compiling Main             ( jdoodle.hs, jdoodle.o )
Linking jdoodle ...
"kdvnhoo lv ixq"
"haskell is functionall programming language"
