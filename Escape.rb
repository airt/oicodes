
# http://www.codewars.com/kata/5326ef17b7320ee2e00001df

def solve(mine, miner, exit)

  def deepclone(src)
    Marshal.load(Marshal.dump(src))
  end

  def up(pos)
    {'x' => pos['x'], 'y' => pos['y'] - 1}
  end

  def down(pos)
    {'x' => pos['x'], 'y' => pos['y'] + 1}
  end

  def left(pos)
    {'x' => pos['x'] - 1, 'y' => pos['y']}
  end

  def right(pos)
    {'x' => pos['x'] + 1, 'y' => pos['y']}
  end

  def way?(mine, pos)
    x = pos['x']
    y = pos['y']
    (x >= 0) && (y >= 0) &&
      (x <= mine.length - 1) &&
      (y <= mine[0].length - 1) &&
      mine[x][y]
  end

  def wherecango(mine, pos)
    d = []
    d << 'up'    if way?(mine, up(pos))
    d << 'left'  if way?(mine, left(pos))
    d << 'down'  if way?(mine, down(pos))
    d << 'right' if way?(mine, right(pos))
    d
  end

  def go(pos, step)
    case step
    when 'up'    then up(pos)
    when 'left'  then left(pos)
    when 'down'  then down(pos)
    when 'right' then right(pos)
    end
  end

  def save(archives, steps, pos)
    archives.push([deepclone(steps), pos])
    archives
  end

  def load(archives)
    if archives.empty?
      p 'bad archives'
      exit(1)
    end
    steps, pos = archives.pop
    return archives, steps, pos
  end

  def run(mine, archives, steps, pos, exit)
    if pos == exit
      return mine, archives, steps, pos
    end

    directions = wherecango(mine, pos)

    if directions.empty?
      mine[pos['x']][pos['y']] = false
      archives, steps, pos = load(archives)
    else
      if directions.length > 1
        archives = save(archives, steps, pos)
      end
      step = directions.first
      mine[pos['x']][pos['y']] = false
      steps = steps << step
      pos = go(pos, step)
    end

    run(mine, archives, steps, pos, exit)
  end

  mine, archives, steps, pos = run(deepclone(mine), [], [], miner, exit)
  steps
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

  minemap = [
    [true , true , true , true , true ],
    [true , false, true , false, true ],
    [false, true , true , true , false],
    [true , false, false, true , true ],
    [true , true , true , true , false]
  ]
  paint_map(minemap)

  puts solve(minemap, {'x'=>0,'y'=>4}, {'x'=>3,'y'=>0})

  # ['up','up','right','right','down','right','right','up','up','up','left']

end
