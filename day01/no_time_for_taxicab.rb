path = File.read('code.txt').split(' ')
d = Hash.new(0)
facing = :north
path.each do |p|
  direction = p[0]
  distance = p[1..-1].to_i
  case facing
    when :north
      facing = direction == 'L' ? :west : :east
    when :east
      facing = direction == 'L' ? :north : :south
    when :south
      facing = direction == 'L' ? :east : :west
    else
      facing = direction == 'L' ? :south : :north
  end
  d[facing] += distance
end
vertical = d[:north] > d[:south] ? d[:north]-d[:south] : d[:south]-d[:north]
horizontal = d[:west] > d[:east] ? d[:west]-d[:east] : d[:east]-d[:west]
puts "You are #{horizontal + vertical} blocks away"