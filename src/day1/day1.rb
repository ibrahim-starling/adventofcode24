# frozen_string_literal: true
require 'set'

def part1(file_name)
  array1 = []
  array2 = []

  File.foreach(file_name) do |line|
    num1, num2 = line
                   .strip
                   .split("\s")
                   .map!(&:to_i)
    array1.push(num1)
    array2.push(num2)
  end

  array1.sort!
  array2.sort!

  sum = 0

  array1.zip(array2).each do |num1, num2|
    sum += (num1 - num2).abs
  end

  sum
end

def part2(file_name)
  set = Set.new
  array = []

  File.foreach(file_name) do |line|
    num1, num2 = line
                   .strip
                   .split("\s")
                   .map!(&:to_i)
    set.add(num1)
    array.push(num2)
  end

  sum = 0
  array_dict = array.tally

  set.each do |num|
    sum += num * array_dict.fetch(num, 0)
  end

  sum
end

puts(part1 'input.txt')
puts(part2 'input.txt')
