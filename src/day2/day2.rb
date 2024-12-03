# frozen_string_literal: true

# Monkey Patching (Extension Functions in Kotlin)
class Array
  def increasing?
    (1..self.length - 1).each { |i|
      if self[i - 1] >= self[i]
        return false
      end
    }
    true
  end

  def decreasing?
    (1..self.length - 1).each { |i|
      if self[i - 1] <= self[i]
        return false
      end
    }
    true
  end

  def safe_diff?
    (1..self.length - 1).each do |idx|
      if (self[idx] - self[idx - 1]).abs == 0 or (self[idx] - self[idx - 1]).abs >= 4
        return false
      end
    end
    true
  end
end

def part1(input_file)
  safe_count = 0
  File.foreach(input_file) do |line|
    array = line.split.map(&:to_i)
    if array.safe_diff? && (array.decreasing? || array.increasing?)
      safe_count += 1
    end
  end
  safe_count
end

puts part1('input.txt')