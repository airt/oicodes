
# http://www.codewars.com/kata/526c7b931666d07889000a3c

##
# 0-9 Push this number onto the stack.
# + Addition: Pop a and b, then push a+b.
# - Subtraction: Pop a and b, then push b-a.
# * Multiplication: Pop a and b, then push a*b.
# / Integer division: Pop a and b, then push b/a, rounded down.
#   If a is zero, push zero.
# % Modulo: Pop a and b, then push the b%a. If a is zero, push zero.
# ! Logical NOT: Pop a value. If the value is zero, push 1; otherwise,
#   push zero.
# ` Greater than: Pop a and b, then push 1 if b>a, otherwise push zero.
# > Start moving right.
# < Start moving left.
# ^ Start moving up.
# v Start moving down.
# ? Start moving in a random cardinal direction.
# _ Pop a value; move right if value = 0, left otherwise.
# | Pop a value; move down if value = 0, up otherwise.
# " Start string mode: push each character's ASCII value all the way
#   up to the next ".
# : Duplicate value on top of the stack.
#   If there is nothing on top of the stack, push a 0.
# \ Swap two values on top of the stack.
#   If there is only one value,
#   pretend there is an extra 0 on bottom of the stack.
# $ Pop value from the stack and discard it.
# . Pop value and output as an integer.
# , Pop value and output the ASCII character represented
#   by the integer code that is stored in the value.
# # Trampoline: Skip next cell.
# p A "put" call (a way to store a value for later use).
#   Pop y, x and v, then change the character at the position (x,y)
#   in the program to the character with ASCII value v.
# g A "get" call (a way to retrieve data in storage).
#   Pop y and x, then push ASCII value of the character
#   at that position in the program.
# @ End program.
# (i.e. a space) No-op. Does nothing.
module Befunge
  module_function

  def interpret(string)
    code = string.split(/\n|\\n/)
    move('', code, [], '>', [0, 0], false)
  end

  def step(d, pos)
    case d
    when '^' then [pos[0] - 1, pos[1]]
    when 'v' then [pos[0] + 1, pos[1]]
    when '<' then [pos[0], pos[1] - 1]
    when '>' then [pos[0], pos[1] + 1]
    else
      puts "error d: #{d}"
      exit(1)
    end
  end

  def move(output, code, stack, d, pos, stringmode)
    # pos: [line, column]
    c = code[pos[0]][pos[1]]
    if stringmode
      if c == '"'
        stringmode = false
      else
        stack.push c.ord
      end
    else
      case c
      when /[0-9]/
        stack.push c.to_i
      when '+'
        stack.push(stack.pop + stack.pop)
      when '-'
        stack.push(-stack.pop + stack.pop)
      when '*'
        stack.push(stack.pop * stack.pop)
      when '/'
        a = stack.pop
        b = stack.pop
        stack.push a == 0 ? 0 : (b / a).floor
      when '%'
        a = stack.pop
        b = stack.pop
        stack.push a == 0 ? 0 : (b % a)
      when '!'
        stack.push stack.pop == 0 ? 1 : 0
      when '`'
        stack.push stack.pop < stack.pop ? 1 : 0
      when '>' then d = c
      when '<' then d = c
      when '^' then d = c
      when 'v' then d = c
      when '?' then d = ['>', '<', '^', 'v'][rand 0..3]
      when '_'
        d = stack.pop == 0 ? '>' : '<'
      when '|'
        d = stack.pop == 0 ? 'v' : '^'
      when '"' then stringmode = true
      when ':'
        stack.push(stack.empty? ? 0 : stack.last)
      when '\\'
        a = stack.pop
        b = stack.empty? ? 0 : stack.pop
        stack.push a
        stack.push b
      when '$' then stack.pop
      when '.'
        output << stack.pop.to_s
      when ','
        output << stack.pop.chr
      when '#'
        pos = step(d, pos)
      when 'p'
        code[stack.pop][stack.pop] = stack.pop.chr
      when 'g'
        stack.push code[stack.pop][stack.pop].ord
      when '@'
        return output
      when ' ' # pass
      else
        puts "error c: #{c}"
        exit(2)
      end
    end
    npos = step(d, pos)
    move(output, code, stack, d, npos, stringmode)
  end
end

if __FILE__ == $0

  input =
    if ARGV.length == 1
      # filepath
      if File.exist? ARGV[0]
        File.read ARGV[0]
      else
        puts 'Error: File does not exist'
        exit(1)
      end

    elsif ARGV.length == 2 && ['-e', '--eval'].include?(ARGV[0])
      # eval
      ARGV[1]
    else
      puts 'Error: Arguments is required'
      exit(2)
    end

  puts Befunge.interpret input

end
