require 'matrix'
require 'set'

def in_bounds?(cur, arr)
  i, j = cur
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

p part1('input.txt')