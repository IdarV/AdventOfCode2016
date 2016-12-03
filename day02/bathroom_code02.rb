codes = File.readlines('code.txt')
horizontal = 0
vertical = 2
pad = [[nil, nil, 1],[nil, 2, 3, 4],[5, 6, 7, 8, 9], [nil, 'A', 'B', 'C'], [nil, nil, 'D']]
codes.each do |code|
  code.chars.each do |direction|
    case direction
      when 'D'
        vertical += 1 unless vertical + 1 > 4 or pad[vertical + 1][horizontal].nil?
      when 'U'
        vertical -= 1 unless vertical - 1 < 0 or pad[vertical - 1][horizontal].nil?
      when 'L'
        horizontal -= 1 unless horizontal - 1 < 0 or pad[vertical][horizontal - 1].nil?
      when 'R'
        horizontal += 1 unless horizontal + 1 > 4 or pad[vertical][horizontal + 1].nil?
      else #nothing
    end
  end
  print "#{pad[vertical][horizontal]}"
end
