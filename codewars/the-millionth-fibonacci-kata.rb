# https://www.codewars.com/kata/the-millionth-fibonacci-kata

require 'matrix'

def fib(n)
  (Matrix[[1, 1], [1, 0]] ** n)[1, 0]
end
