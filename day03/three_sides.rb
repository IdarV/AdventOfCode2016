possible = 0
File.open('code.txt').read.each_line do |line|
  triangle_sides = line.split.map(&:to_i).sort
  possible += 1 if triangle_sides[0] + triangle_sides[1] > triangle_sides[2]
end
puts possible