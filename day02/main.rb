# frozen_string_literal: true

input = $<.read.split(/\n/)

# Precompile regexes
match_red   = /(\d+) red/
match_green = /(\d+) green/
match_blue  = /(\d+) blue/

def max_color(line, regex)
  line.scan(regex).flatten.map(&:to_i).max
end

# Part 1
part1 = input.sum do |line|
  red  = max_color(line, match_red)
  next 0 if red > 12

  green = max_color(line, match_green)
  next 0 if green > 13

  blue = max_color(line, match_blue)
  next 0 if blue > 14

  line.match(/^Game (\d+)/)[1].to_i
end

puts "Part 1: #{part1}"

# Part 2
part2 = input.sum do |line|
  red   = max_color(line, match_red)
  green = max_color(line, match_green)
  blue  = max_color(line, match_blue)

  red * green * blue
end

puts "Part 2: #{part2}"
