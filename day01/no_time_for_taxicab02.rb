path = File.read('code.txt').split(' ')
d = Hash.new(0)
facing = :north
trail = []
should_break = nil
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
  distance.times do
    d[facing] += 1
    coordinates = "H#{d[:west]-d[:east]}V#{d[:north]-d[:south]}"
    should_break = trail.include? coordinates
    trail << coordinates
    break if should_break
  end
  break if should_break
end
vertical = d[:north] > d[:south] ? d[:north]-d[:south] : d[:south]-d[:north]
horizontal = d[:west] > d[:east] ? d[:west]-d[:east] : d[:east]-d[:west]
puts "You are #{horizontal + vertical} blocks away"