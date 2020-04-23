require 'bundler'
Bundler.require

require_relative 'lib/case'

@a_spaces = [Case.new("A1", "X"), Case.new("A2", "X"), Case.new("A3", "X")]

def is_valid?(input)
  x = 0
  @a_spaces.each do |case_|
    x += 1 if case_.content == input
  end 
  puts "YES ITS VALID" if x == 1
end

puts is_valid?(" ")