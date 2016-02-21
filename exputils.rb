
##
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
module ExpUtils

  PRIORITIES = {
    '(' => 0,
    ')' => 9,
    '+' => 6,
    '-' => 6,
    '*' => 7,
    '/' => 7,
    '%' => 7,
    '^' => 8
  }

  module_function

  def eval(input)
    eval_suffix infix_to_suffix tokenize input
  end

  def tokenize(input)
    plums = input.clone
    PRIORITIES.keys.each { |o| plums.gsub!(o, ' ' + o + ' ') }
    tokens = plums.strip.split(/\s+/)
    tokens.reduce [] do |acc, x|
      if !acc[-1].nil? && acc[-1] == '-' &&
          (acc[-2].nil? || PRIORITIES.keys.include?(acc[-2]))
        acc[0..-2] << ('-' + x)
      else
        acc << x
      end
    end
  end

  def infix_to_suffix(arr_infix)
    oprs_stack = []
    arr_suffix = []

    arr_infix.each do |e|
      if !PRIORITIES.key? e # e is Numeric
        arr_suffix << e
      elsif e == ')'
        loop do
          o = oprs_stack.pop
          break if o == '('
          arr_suffix << o
        end
      elsif e == '(' ||
          oprs_stack.empty? ||
          [e, oprs_stack.last]
            .map { |o| PRIORITIES[o] }
            .reduce(&:>)
        oprs_stack << e

      else # e <= oprs_stack.last
        loop do
          opr = oprs_stack.pop
          arr_suffix << opr
          break if oprs_stack.empty? ||
                    [opr, oprs_stack.last]
                      .map { |o| PRIORITIES[o] }
                      .reduce(&:==)
        end
        oprs_stack << e
      end
      # puts "e: #{e.inspect}"
      # puts "oprs_stack: \n#{oprs_stack.inspect}"
      # puts "arr_suffix: \n#{arr_suffix.inspect}"
      # puts "----------"
    end

    arr_suffix + oprs_stack.reverse
  end

  def opr_to_lambda(opr)
    osym = (opr == '^' ? '**' : opr).to_sym
    -> (x) { x.reduce(&osym) }
  end

  def eval_suffix(arr_suffix)
    runtime = []

    arr_suffix.each do |e|
      if !PRIORITIES.key? e # e is Numeric
        runtime << e.to_r
      else
        begin
          runtime <<
            opr_to_lambda(e)
              .call([runtime.pop, runtime.pop].reverse)

        rescue ZeroDivisionError
          return 'ZeroDivisionError'
        end
      end
    end

    runtime.last
  end
end

if __FILE__ == $0

  loop do
    print ' > '
    input = STDIN.gets
    break if input.nil?
    input.chomp!
    next if input.empty?
    print ' => '
    puts ExpUtils.eval input
  end

end
