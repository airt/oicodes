
module MorseDecoder
  module_function

  def decode_bits(bits)
    bits = bits.gsub(/^0+|0+$/, '')
    blen = bits.scan(/0+|1+/).map(&:length).min
    bits.split('0' * 7 * blen).map do |wd|
      wd.split('0' * 3 * blen).map do |c|
        c.split('0' * blen).map do |b|
          b.size > blen ? '-' : '.'
        end.join
      end.join(' ')
    end.join('   ')
  end

  def decode_code(morse_code)
    morse_code
      .strip
      .split('   ')
      .map do |wd|
        wd.split(' ')
          .map do |c|
            MORSECODES[c]
          end.join
      end.join(' ')
  end

  MORSECODES = {
    '.-'   => 'A',
    '-...' => 'B',
    '-.-.' => 'C',
    '-..'  => 'D',
    '.'    => 'E',
    '..-.' => 'F',
    '--.'  => 'G',
    '....' => 'H',
    '..'   => 'I',
    '.---' => 'J',
    '-.-'  => 'K',
    '.-..' => 'L',
    '--'   => 'M',
    '-.'   => 'N',
    '---'  => 'O',
    '.--.' => 'P',
    '--.-' => 'Q',
    '.-.'  => 'R',
    '...'  => 'S',
    '-'    => 'T',
    '..-'  => 'U',
    '...-' => 'V',
    '.--'  => 'W',
    '-..-' => 'X',
    '-.--' => 'Y',
    '--..' => 'Z',
    '.----' => '1',
    '..---' => '2',
    '...--' => '3',
    '....-' => '4',
    '.....' => '5',
    '-....' => '6',
    '--...' => '7',
    '---..' => '8',
    '----.' => '9',
    '-----' => '0',
    '..--..' => '?',
    '-.-.--' => '!',
    '-..-.'  => '/',
    '-...-'  => '-',
    '.-.-.-' => '.',
    '-.--.-' => '()',
    '...---...' => 'SOS'
  }
end

if __FILE__ == $0

  bits =
    '11001100110011000000110000001111110011001111110011' <<
    '11110000000000000011001111110011111100111111000000' <<
    '110011001111110000001111110011001100000011'
  code = MorseDecoder.decode_bits(bits)
  text = MorseDecoder.decode_code(code)
  puts 'bits: ' + bits
  puts 'code: ' + code
  puts 'text: ' + text

end
