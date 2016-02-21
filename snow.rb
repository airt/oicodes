
module Snow
  module_function

  # From: oschina.net/code/snippet_98523_27338
  def snow
    r, c = `stty size`.split.map(&:to_i)
    s = [0x2743].pack("U*")
    h = {}
    puts "\033[2J"
    loop do
      h[rand(c)] ||= 0
      h.each do |x, o|
        h[x] = (h[x] + 1) % (r + 1)
        print "\033[#{o};#{x}H \033[#{h[x]};#{x}H#{s} \033[0;0H"
      end
      $stdout.flush
      sleep 0.1
    end
  end
end

if __FILE__ == $0

  Snow.snow

end
