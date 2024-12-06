require 'matrix'
require 'set'

def in_bounds?(cur, arr)
  i, j = cur
  if i == nil || j == nil
    return false
  end
  (i >= 0 && i < arr.length) && (j >= 0 && j < arr[0].length)
end

def part1(input_file)
  arr = File.read(input_file)
            .split
            .map { |str| str.split '' }

  cur = Matrix[*arr].index("^")
  orientation = [[-1, 0], [0, 1], [1, 0], [0, -1]]
  orientation_idx = 0
  unique_positions = Set.new

  while in_bounds?(cur, arr)
    i, j = cur
    y, x = orientation[orientation_idx % 4]
    if in_bounds?([i + y, j + x], arr)
      if arr[i + y][j + x] != '#'
        cur = [i + y, j + x]
      else
        orientation_idx += 1
      end
      unique_positions.add([i, j])
    else
      return unique_positions.length + 1
    end
  end
  unique_positions.length
end

def part2(input_file)
  def stuck_in_loop?(arr)
    cur = Matrix[*arr].index("^")
    orientation = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    orientation_idx = 0
    unique_positions_with_orientation = Set.new

    while in_bounds?(cur, arr)
      i, j = cur
      y, x = orientation[orientation_idx % 4]
      if in_bounds?([i + y, j + x], arr)
        if arr[i + y][j + x] != '#'
          cur = [i + y, j + x]
        else
          orientation_idx += 1
        end
        if unique_positions_with_orientation.include?([cur[0], cur[1], orientation_idx % 4])
          return true
        else
          unique_positions_with_orientation.add([cur[0], cur[1], orientation_idx % 4])
        end
      else
        return false
      end
    end
    false
  end

  arr = File.read(input_file)
            .split
            .map { |str| str.split '' }

  cnt = 0
  (0..arr.length - 1).each do |i|
    (0..arr[0].length - 1).each do |j|
      if arr[i][j] == '.'
        new_array = Marshal.load(Marshal.dump(arr))
        new_array[i][j] = '#'
        if stuck_in_loop?(new_array)
          cnt += 1
        end
      end
    end
  end
  cnt
end

p part1('input.txt')
p part2('input.txt')