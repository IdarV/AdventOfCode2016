codes = File.readlines('code.txt')
horizontal = vertical = 1
pad = [[1,2,3],[4,5,6],[7,8,9]]
codes.each do |code|
  code.chars.each do |direction|
    case direction
      when 'D'
        vertical += 1 if vertical + 1 <= 2
      when 'U'
        vertical -= 1 if vertical - 1 >= 0
      when 'L'
        horizontal -= 1 if horizontal - 1 >= 0
      when 'R'
        horizontal += 1 if horizontal + 1 <= 2
      else # nothing
    end
  end
  print "#{pad[vertical][horizontal]}"
end
