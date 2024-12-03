def part1(input_file)
  File.read(input_file)
      .scan(/mul\((\d+),(\d+)\)/)
      .map { |array| array.map(&:to_i).inject(:*) }
      .sum
end

def part2(input_file)
  skip = false
  sum = 0
  File.read(input_file)
      .scan(/mul\((\d+),(\d+)\)|(don't\(\))|(do\(\))/)
      .map(&:compact)
      .each do |array|
        if array.first == "don't()" or array.first == "do()"
          skip = array.first == "don't()" ? true : false
        else
          unless skip
            sum+=array.map(&:to_i).inject(:*)
          end
        end
  end
  sum
end

puts part1('input.txt')
puts part2('input.txt')
