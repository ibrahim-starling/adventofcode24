require 'benchmark'

class Memo
  def initialize
    @cache = {}
  end

  def memo(function, value, time)
    @cache[[value, time]] ||= method(function).call(value, time)
  end
end

$memo = Memo.new

def compute(stones, blinks)
  if blinks == 0
    return 1
  end

  if stones == 0
    return $memo.memo(:compute, 1, blinks - 1)
  end

  stones_str = stones.to_s
  mid = stones_str.length / 2

  if stones_str.length % 2 == 0
    n_stones_left = stones_str[0..mid - 1].to_i
    n_stones_right = stones_str[mid..stones_str.length - 1].to_i
    return $memo.memo(:compute, n_stones_left, blinks - 1) +
      $memo.memo(:compute, n_stones_right, blinks - 1)
  end

  $memo.memo(:compute, stones * 2024, blinks - 1)
end

def part1_and_2(input_file, blinks)
  arr = File.read(input_file)
            .split ' '
  ans = 0

  arr.each do |str|
    ans += $memo.memo(:compute, str.to_i, blinks)
  end

  ans
end

puts part1_and_2('input.txt', 25)
puts part1_and_2('input.txt', 75)
