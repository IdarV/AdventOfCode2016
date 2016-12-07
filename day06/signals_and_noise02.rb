code = File.readlines('code.txt').map(&:chop)
max_length = code.map(&:length).max
f = code.map{|e| e.chars.values_at(0...max_length)}.transpose
print f.map{|c| c.join.chars.sort_by{|char| c.count char}.first}.join