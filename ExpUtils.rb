
# supports

# > 1 + 2
# => 3/1
# > 1.2 * 2.7
# => 81/25
# > 1/2 * (12 + 1012)
# => 512/1
# > 1 + 2 * 3 - 9 / 6
# => 11/2
# > 2 ^ 100
# => 1267650600228229401496703205376/1
# > 102 / 0
# => ZeroDivisionError

# not support now

# > -233
# ...

module ExpUtils

  PriorityOfOpr = {
    '(' => 0,
    ')' => 9,
    '+' => 1,
    '-' => 1,
    '*' => 2,
    '/' => 2,
    '%' => 2,
    '^' => 3,
  }

  module_function

  def eval(input)
    eval_suffix infix_to_suffix tokenize input
  end

  def tokenize(input)
    plums = input.clone
    PriorityOfOpr.keys
      .each { |o| plums.gsub!(o, ' ' + o + ' ') }
    plums.strip
         .split(/\s+/)
  end

  def infix_to_suffix(arr_infix)
    oprs_stack = []
    arr_suffix = []

    arr_infix.each do |e|
      if !PriorityOfOpr.key?(e) # e is Numeric
        arr_suffix << e
      else
        if e == ')'
          loop do
            o = oprs_stack.pop
            break if o == '('
            arr_suffix << o
          end
        elsif e == '(' ||
            oprs_stack.empty? ||
            [e, oprs_stack.last]
              .map { |o| PriorityOfOpr[o] }
              .reduce(&:>)
          oprs_stack << e

        else # e <= oprs_stack.last
          loop do
            opr = oprs_stack.pop
            arr_suffix << opr
            break if oprs_stack.empty? ||
                      [opr, oprs_stack.last]
                        .map { |o| PriorityOfOpr[o] }
                        .reduce(&:==)
          end
          oprs_stack << e
        end
      end
      # puts "e: #{e.inspect}"
      # puts "oprs_stack: \n#{oprs_stack.inspect}"
      # puts "arr_suffix: \n#{arr_suffix.inspect}"
      # puts "----------"
    end

    arr_suffix + oprs_stack.reverse
  end

  def func_of(opr)
    osym = (opr == '^' ? '**' : opr).to_sym
    -> (x) {
      x.reduce(&osym)
    }
  end

  def eval_suffix(arr_suffix)
    runtime = []

    arr_suffix.each do |e|
      if !PriorityOfOpr.key?(e) # e is Numeric
        runtime << e.to_r
      else
        begin
          runtime <<
            func_of(e)
              .call([runtime.pop, runtime.pop].reverse)

        rescue ZeroDivisionError => e
          return 'ZeroDivisionError'
        end
      end
    end

    runtime.last
  end

end


if __FILE__ == $0

  # require 'pp'

  loop do
    print ' > '
    input = STDIN.gets
    break if input.nil?
    input.chomp!
    next if input.empty?
    print ' => '
    puts ExpUtils.eval(input)
    # pp arr_infix = ExpUtils.tokenize(input)
    # pp arr_suffix = ExpUtils.infix_to_suffix(arr_infix)
    # puts ret = ExpUtils.eval_suffix(arr_suffix)
  end

end
