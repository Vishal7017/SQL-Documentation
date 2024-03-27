---------------------------------------------------------------------------------------------
Name : Vishal Wavhale
Class student number: 590
Activity: 13
---------------------------------------------------------------------------------------------

--Question1: (a)

{-

Function floor, denoted as ⌊x⌋, represents the greatest integer less than or equal to a real number x. For any real number x, the floor function can be defined as:

floor ⌊x⌋ = max{n∈Z:n<=x}

for example,

floor ⌊5.6⌋ = 5
floor ⌊-6.5⌋ = -7

Floor function is a fundamental mathematical concept with various applications. It can be crucial for integer and rounding operations, providing a way to obtain integer values from real numbers based on their magnitude relative to the integers.

-}

================================================================================================================================================================

--Question2: (b)

{-
 
The Haskell code in the file presents two unique strategies for calculating the floor of a floating-point number.

The floor1 function employs an iterative process to find the floor value. It first identifies whether a given float, x, is positive or negative. If x is negative, the function uses the 'until' function in tandem with the 'leq' helper function to iteratively decrease from -1 until it locates a value less than or equal to x. Conversely, if x is positive, the function uses the 'until' function and the 'lt' helper function to increment from 1 until it identifies a number greater than x. The function then adjusts the result by subtracting 1 to obtain the correct floor value. This implementation aims to find the largest integer less than or equal to the input float, mirroring the traditional definition of the floor function.

On the other hand, the floor2 function employs a technique similar to binary search to determine the floor value of a float x. It begins with an interval (m, n) established by the 'bound' function. This interval is progressively narrowed down using the 'shrink' function through iterative steps until the interval size becomes 1, signifying the floor value has been found. The 'unit' function checks if the interval size has reduced to 1, while the 'choice' function identifies the interval's midpoint. The function ultimately returns the floor value as the first element of the interval.

The implementation also comprises several helper functions. 'shrink', 'choose', 'bound', 'lower', and 'upper' manage the interval and binary search operations used in floor2, while 'leq' and 'lt' handle comparison operations used in floor1.

In conclusion, these solutions offer varied methods for handling the floor function, each suitable for different scenarios and precision levels.

-}
