# frozen_string_literal: true

input = $<.each_line

# Precompile regex
match_red   = /(\d+) red/
match_green = /(\d+) green/
match_blue  = /(\d+) blue/

def max_color(line, regex)
  line.scan(regex).flatten.map(&:to_i).max || 0
end

part1 = 0
part2 = 0

input.each_with_index do |line, idx|
  red   = max_color(line, match_red)
  green = max_color(line, match_green)
  blue  = max_color(line, match_blue)

  part2 += red * green * blue

  next if red > 12
  next if green > 13
  next if blue > 14

  part1 += idx + 1
end

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"
