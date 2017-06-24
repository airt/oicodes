# https://www.codewars.com/kata/befunge-interpreter

def interpret(string)
  code = string.split(/\n|\\n/)
  move '', code, [], '>', [0, 0], false
end

def step(d, pos)
  case d
  when '^' then [pos[0] - 1, pos[1]]
  when 'v' then [pos[0] + 1, pos[1]]
  when '<' then [pos[0], pos[1] - 1]
  when '>' then [pos[0], pos[1] + 1]
  else
    puts "error d: #{d}"
    exit 1
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
      stack.push stack.pop + stack.pop
    when '-'
      stack.push -stack.pop + stack.pop
    when '*'
      stack.push stack.pop * stack.pop
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
    when '>'
      d = c
    when '<'
      d = c
    when '^'
      d = c
    when 'v'
      d = c
    when '?'
      d = ['>', '<', '^', 'v'][rand 0..3]
    when '_'
      d = stack.pop == 0 ? '>' : '<'
    when '|'
      d = stack.pop == 0 ? 'v' : '^'
    when '"'
      stringmode = true
    when ':'
      stack.push stack.empty? ? 0 : stack.last
    when '\\'
      a = stack.pop
      b = stack.empty? ? 0 : stack.pop
      stack.push a
      stack.push b
    when '$'
      stack.pop
    when '.'
      output << stack.pop.to_s
    when ','
      output << stack.pop.chr
    when '#'
      pos = step d, pos
    when 'p'
      code[stack.pop][stack.pop] = stack.pop.chr
    when 'g'
      stack.push code[stack.pop][stack.pop].ord
    when '@'
      return output
    when ' '
      # pass
    else
      puts "error c: #{c}"
      exit 2
    end
  end
  npos = step d, pos
  move output, code, stack, d, npos, stringmode
end
