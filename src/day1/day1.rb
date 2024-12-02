# frozen_string_literal: true

def part1(file_name)
  array1 = []
  array2 = []

  File.foreach(file_name) do |line|
    num1, num2 = line
                   .strip
                   .split("\s")
    array1.push(num1.to_i)
    array2.push(num2.to_i)
  end

  array1.sort!
  array2.sort!

  sum = 0
  array1.each_index do |x|
    sum += (array1[x] - array2[x]).abs
  end

  sum
end

def part2(file_name)
  array1 = []
  array2 = []

  File.foreach(file_name) do |line|
    num1, num2 = line
                   .strip
                   .split("\s")
    array1.push(num1.to_i)
    array2.push(num2.to_i)
  end

  sum = 0
  array2_count = array2.tally

  array1.each do |num|
    sum += num * array2_count.fetch(num, 0)
  end

  sum
end

puts(part1 'input.txt')
puts(part2 'input.txt')
