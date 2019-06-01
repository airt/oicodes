-- https://www.codewars.com/kata/a-simple-postfix-language

module Postfix where

begin = ($ ())
push s x = ($ (x, s))
add (x, (y, s)) = ($ (x + y, s))
end (x, s) = x
