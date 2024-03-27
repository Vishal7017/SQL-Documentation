---------------------------------------------------------------------------------------------
This activity submitted by Rohith Damarla (520053890)
Class student number: 248 
Activity: 13
---------------------------------------------------------------------------------------------

--Question1: (a)

{-

The function floor, denoted as ⌊x⌋, represents the greatest integer less than or equal to a real number x. Formally, for any real number x, the floor function is mathematically defined as:

floor ⌊x⌋ = max{n∈Z:n<=x}

for example,

floor ⌊5.6⌋ = 5
floor ⌊-6.5⌋ = -7

Overall, the floor function is a fundamental mathematical concept with various applications in mathematics, computer science, and engineering. It plays a crucial role in integer and rounding operations, providing a way to obtain integer values from real numbers based on their magnitude relative to the integers.

-}

================================================================================================================================================================

--Question2: (b)

{-

The provided Haskell code in the file "floors.lhs" implements two distinct approaches to compute the floor of a floating-point number.


In order to determine the floor value, the floor1 function first uses an iterative process. This function determines if a given float, x, is positive or negative. Using the until function in combination with the leq helper function, the function iteratively decreases from -1 if x is negative until it finds a value less than or equal to x. In contrast, the function uses the until function and the lt helper function to increment from 1 until it finds a number bigger than x if x is positive. Next, to get the correct floor value, the result is adjusted by subtracting 1. Finding the largest integer less than or equal to the input float is the goal of this implementation, which closely resembles the floor function's conventional meaning.

In contrast, the floor2 function uses a method akin to binary search to ascertain a float x's floor value. It starts with the bound function-established interval (m, n). This interval is gradually reduced using the shrink function through iterative stages until the interval size equals 1, indicating the discovery of the floor value. The unit function determines whether the interval size has shrunk to 1, while the choice function determines the interval's midpoint. The floor value is ultimately returned by the function as the interval's first element.

The implementation also includes a number of helper functions, including shrink, choose, bound, lower, and upper for managing the interval and binary search operations used in floor2, and leq and lt for comparison operations used in floor 1.

To sum up, these solutions present differing approaches to managing the floor function, each appropriate for various situations and levels of precision. To quickly ascertain the floor value of a given float number, floor2 uses a more streamlined binary search-like technique than floor1, which uses a linear search strategy with conditional branching.



-}