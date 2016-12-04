total = 0
File.open('code.txt').read.each_line do |code|
  checksum = code.scan(/\[(.*?)\]/).first.first
  code.slice! checksum
  code.slice! '[]'
  numbers = code.split('-')
  sector_id = numbers.delete numbers.last
  count = numbers.join.chars.sort.join.downcase.each_char.with_object({}){|c, h|(h[c] = h.fetch(c, 0) + 1)}
  max = 5
  sum = ''
  while max > 0
    frequent_char = count.max_by { |_k, v| v }
    sum += frequent_char[0]
    count.delete frequent_char[0]
    max = max - 1
  end
  total += sector_id.to_i if sum.eql? checksum
end
puts total