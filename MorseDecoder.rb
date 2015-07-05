
module MorseDecoder

  module_function

  def decode_bits(bits)
    bits = bits.gsub(/^0+|0+$/, '')
    blen = bits.scan(/0+|1+/).map(&:length).min
    # bits.gsub!(Regexp.new('1{3}'  * blen), '-')
    # bits.gsub!(Regexp.new('1'     * blen), '.')
    # bits.gsub!(Regexp.new('0{7}'  * blen), '   ')
    # bits.gsub!(Regexp.new('0{3}'  * blen), ' ')
    # bits.gsub!(Regexp.new('0'     * blen), '')
    # bits
    bits.split('0' * 7 * blen).map { |wd|
      wd.split('0' * 3 * blen).map { |c|
        c.split('0' * blen).map { |b|
          b.size > blen ? '-' : '.'
        }.join
      }.join(' ')
    }.join('   ')
  end

  def decode_code(morse_code)
    morse_code
      .strip
      .split('   ')
      .map { |wd|
        wd.split(' ')
          .map { |c|
            MorseCodeTable[c]
          }.join
      }.join(' ')
  end

  MorseCodeTable = {
    ".-"   => "A",
    "-..." => "B",
    "-.-." => "C",
    "-.."  => "D",
    "."    => "E",
    "..-." => "F",
    "--."  => "G",
    "...." => "H",
    ".."   => "I",
    ".---" => "J",
    "-.-"  => "K",
    ".-.." => "L",
    "--"   => "M",
    "-."   => "N",
    "---"  => "O",
    ".--." => "P",
    "--.-" => "Q",
    ".-."  => "R",
    "..."  => "S",
    "-"    => "T",
    "..-"  => "U",
    "...-" => "V",
    ".--"  => "W",
    "-..-" => "X",
    "-.--" => "Y",
    "--.." => "Z",
    ".----" => "1",
    "..---" => "2",
    "...--" => "3",
    "....-" => "4",
    "....." => "5",
    "-...." => "6",
    "--..." => "7",
    "---.." => "8",
    "----." => "9",
    "-----" => "0",
    "..--.." => "?",
    "-.-.--" => "!",
    "-..-."  => "/",
    "-...-"  => "-",
    ".-.-.-" => ".",
    "-.--.-" => "()",
    "...---..." => "SOS",
  }

end

if __FILE__ == $0

  puts bits = '1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011'
  puts code = MorseDecoder.decode_bits(bits)
  puts text = MorseDecoder.decode_code(code)

end
