# http://www.oschina.net/code/snippet_98523_27338

def snow
  r, c = `stty size`.split.map(&:to_i)
  s = [0x2743].pack 'U*'
  h = {}
  puts csi [2], 'J'
  loop do
    h[rand c] ||= 0
    h.each do |x, o|
      h[x] = (h[x] + 1) % (r + 1)
      print "#{csi [o, x], 'H'} #{csi [h[x], x], 'H'}#{s} #{csi [0, 0], 'H'}"
    end
    STDOUT.flush
    sleep 0.07
  end
end

def csi(args, code)
  "\e[#{args.join ';'}#{code}"
end

if __FILE__ == $0
  snow
end
