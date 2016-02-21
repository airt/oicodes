
## Index
  * [ExpUtils](#ExpUtils)
  * [Heart](#Heart)
  * [Escape](#Escape)
  * [Befunge](#Befunge)
  * [MorseDecoder](#MorseDecoder)

### <a name = "ExpUtils"/> ExpUtils

Evaluate mathematical expression.<br/>
Given a mathematical expression as a string and return the result as a number.<br/>

```ruby
require './exputils'
# ..
it = ExpUtils.eval input
# ..
```

    $ rb exputils.rb
    > 1 + (2 - -3) * 4 ^ 5
    => 5121/1

### <a name = "Heart"/> Heart

    $ rb heart.rb
    # then you'll see it.

### <a name = "Escape"/> Escape

> A poor miner is trapped in a mine and you have to help him to get out.<br/>
> ..<br/>
> [Kata Stats: Escape the Mines | Codewars](http://www.codewars.com/kata/5326ef17b7320ee2e00001df)<br/>

### <a name = "Befunge"/> Befunge

    $ rb befunge.rb example.befunge
    $ rb befunge.rb -e '>987v>.v\nv456<  :\n>321 ^ _@'

> Esoteric languages are pretty hard to program,
> but it's fairly interesting to write interpreters for them.<br/>
> ..<br/>
> [Befunge - Wikipedia](https://en.wikipedia.org/wiki/Befunge)<br/>
> [Kata Stats: Befunge Interpreter | Codewars](http://www.codewars.com/kata/526c7b931666d07889000a3c)<br/>

### <a name = "MorseDecoder"/> MorseDecoder

```ruby
require './morsedecoder'
# ..
bits =
  '11001100110011000000110000001111110011001111110011' +
  '11110000000000000011001111110011111100111111000000' +
  '110011001111110000001111110011001100000011'
code = MorseDecoder.decode_bits(bits)
text = MorseDecoder.decode_code(code)
# ..
```

> [Morse Code - Wikipedia](https://en.wikipedia.org/wiki/Morse_code)<br/>
> [Kata Stats: Decode the Morse code (advanced) | Codewars](http://www.codewars.com/kata/54b72c16cd7f5154e9000457)<br/>
