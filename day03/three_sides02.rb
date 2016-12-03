index = 0
possible = 0
text = File.open('code.txt').read
numbers = Array.new
text.each_line { |line| numbers << line.split.map(&:to_i) }
while index < numbers.size
  for i in 0..2 do
    triangle = Array.new
    (0..2).each { |j| triangle << numbers[index + j][0 + i] }
    triangle.sort!
    possible += 1 if triangle[0] + triangle[1] > triangle[2]
  end
  index = index + 3
end
puts possible