
class Maze

  def initialize(map)
    @map = copy_map(map)
  end

  def run(entrance, exit)
    x , y    = entrance[:x], entrance[:y]
    ex, ey   = exit[:x],     exit[:y]
    @archive = [[x, y]]
    @path    = [[]]

    loop do
      step = which_way(x, y)
      case step.length
      when 0 then x, y = load
      when 1 then x, y = next_step(step[0], x, y)
      else
        save(x, y)
        x, y = next_step(step[0], x, y)
      end
      break if x == ex && y == ey
    end
    return @path.flatten
  end

  def next_step(direction, x, y)
    @map[y][x] = false
    @path.last << direction
    case direction
    when :up
      y -= 1
    when :down
      y += 1
    when :left
      x -= 1
    when :right
      x += 1
    end
    return x, y
  end

  def which_way(x, y)
    step = []
    step << :up    if is_way?(x, y - 1)
    step << :down  if is_way?(x, y + 1)
    step << :left  if is_way?(x - 1, y)
    step << :right if is_way?(x + 1, y)
    return step
  end

  def is_way?(x, y)
    return false if (x < 0) || (y < 0) || (x > @map[0].length-1) || (y > @map.length-1)
    return @map[y][x]
  end

  def save(x, y)
    @path.push([])
    @archive.push([x, y])
  end

  def load
    raise 'mysterious error' if @archive.empty?
    @path.pop
    x, y = @archive.pop
    return x, y
  end

  def copy_map(src)
    lx, ly = src.length, src[0].length
    ret = Array.new(lx) {Array.new(ly)}
    lx.times do |i|
      ret[i] = src[i].dup
    end
    return ret
  end

end

def solve(map, entrance, exit)
  steps = Maze.new(map).run(entrance, exit)
  puts "entrance: #{entrance}"
  puts "exit:     #{exit}"
  puts 'steps:'
  p steps
end

def paint_map(map)
  way  = [0x2743].pack("U*") + ' '
  wall = '  '

  view = []
  view << '┌' + '─' * (map[0].length * 2 + 1) + '┐'
  map.each do |r|
    row = ''
    row << '│ '
    r.each do |e|
      row << (e ? way : wall)
    end
    row  << '│ '
    view << row
  end
  view << '└' + '─' * (map[0].length * 2 + 1) + '┘'

  puts "map:"
  puts "way:  '#{way}'"
  puts "wall: '#{wall}'"
  view.each do |row|
    puts row
  end
end

if __FILE__ == $0

  map = [
    [true , true , true , true , true ],
    [true , false, false, false, false],
    [true , false, true , true , true ],
    [true , false, false, false, true ],
    [true , true , true , true , true ]
  ]
  paint_map(map)

  puts 'First------------------------------'
  entrance = {x: 2, y: 2}
  exit     = {x: 4, y: 0}
  solve(map, entrance, exit)

  puts 'Second------------------------------'
  entrance = {x: 4, y: 0}
  exit     = {x: 2, y: 2}
  solve(map, entrance, exit)

end
