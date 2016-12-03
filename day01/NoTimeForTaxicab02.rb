path = %w[L2 L5 L5 R5 L2 L4 R1 R1 L4 R2 R1 L1 L4 R1 L4 L4 R5 R3 R1 L1 R1 L5 L1 R5 L4 R2 L5 L3 L3 R3 L3 R4 R4 L2 L5 R1 R2 L2 L1 R3 R4 L193 R3 L5 R45 L1 R4 R79 L5 L5 R5 R1 L4 R3 R3 L4 R185 L5 L3 L1 R5 L2 R1 R3 R2 L3 L4 L2 R2 L3 L2 L2 L3 L5 R3 R4 L5 R1 R2 L2 R4 R3 L4 L3 L1 R3 R2 R1 R1 L3 R4 L5 R2 R1 R3 L3 L2 L2 R2 R1 R2 R3 L3 L3 R4 L4 R4 R4 R4 L3 L1 L2 R5 R2 R2 R2 L4 L3 L4 R4 L5 L4 R2 L4 L4 R4 R1 R5 L2 L4 L5 L3 L2 L4 L4 R3 L3 L4 R1 L2 R3 L2 R1 R2 R5 L4 L2 L1 L3 R2 R3 L2 L1 L5 L2 L1 R4]
# path = %w[R8, R4, R4, R8]
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
    puts coordinates
    should_break = trail.include? coordinates
    puts "BEAKING BAD\n#{trail}\n#{coordinates}" if should_break
    trail << coordinates
    break if should_break
  end
  break if should_break
end
vertical = d[:north] > d[:south] ? d[:north]-d[:south] : d[:south]-d[:north]
horizontal = d[:west] > d[:east] ? d[:west]-d[:east] : d[:east]-d[:west]
puts "You are #{horizontal + vertical} blocks away"