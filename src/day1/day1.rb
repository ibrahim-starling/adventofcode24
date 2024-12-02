# frozen_string_literal: true

array1 = []
array2 = []

File.foreach('input.txt') do |line|
  num1, num2 = line
                 .strip
                 .split("\s")
  array1.push(num1.to_i)
  array2.push(num2.to_i)
end

# Sort Arrays in place
array1.sort!
array2.sort!

sum = 0
array1.each_index do |x|
  sum += (array1[x] - array2[x]).abs
end

puts sum
