module Heart

  module_function

  def h2d
    output = ''
    (-15...15).each do |y1|
      y = y1 / -10.0
      (-30...30).each do |x1|
        x = x1 / 20.0
        output << ((x**2 + y**2 - 1)**3 <= (x**2 * y**3) ? '*' : ' ')
      end
      output << "\n"
    end
    output
  end

  def h3d
    output = ''
    ac = '.:-=+*#%@'
    (-30...30).each do |zn20|
      z = zn20 / -20.0
      (-60...60).each do |x40|
        x = x40 / 40.0
        if f(x, 0.0, z) <= 0
          y0 = h(x, z)
          ny = 0.01
          nx = h(x + ny, z) - y0
          nz = h(x, z + ny) - y0
          d = (nx + ny - nz) / Math.sqrt(nx**2 + ny**2 + nz**2) * 2.5 + 2.5
          output << ac[d]
        else
          output << ' '
        end
      end
      output << "\n"
    end
    output
  end

  def f(x, y, z)
    a = x**2 + 9.0 / 4.0 * y**2 + z**2 - 1
    a**3 - x**2 * z**3 - 9.0 / 80.0 * y**2 * z**3
  end

  def h(x, z)
    (-1000...0).each do |yn1000|
      y = yn1000 / -1000.0
      return y if f(x, y, z) <= 0
    end
    0
  end

end

if __FILE__ == $0
  puts Heart.h2d
  puts Heart.h3d
end
