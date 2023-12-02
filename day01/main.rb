# frozen_string_literal: true

input = $<.read.split(/\n/)

# Part 1
part1 = input.sum do |line|
  list = line.scan(/\d/)
  next 0 if list.empty?

  list.then { _1.first + _1.last }.to_i
end

puts "Part 1: #{part1}"
puts "---"

def word_to_digit(word)
  case word
  when 'one'
    1
  when 'two'
    2
  when 'three'
    3
  when 'four'
    4
  when 'five'
    5
  when 'six'
    6
  when 'seven'
    7
  when 'eight'
    8
  when 'nine'
    9
  else
    word.to_i
  end
end

part2 = input.sum do |line|
  list = line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten
  next 0 if list.empty?

  list.then { word_to_digit(_1.first) * 10 + word_to_digit(_1.last) }
end

puts "Part 2: #{part2}"
