total = 0
File.open('code.txt').read.each_line do |code|
  checksum = code.scan(/\[(.*?)\]/).first.first
  code.slice! checksum
  code.slice! '[]'
  numbers = code.split('-')
  sector_id = numbers.delete(numbers.last).to_i
  alphabet = Array('a'..'z')
  encrypter = Hash[alphabet.zip(alphabet.rotate(sector_id%26))]
  deciphered = numbers.join(' ').chars.map{|c| encrypter.fetch(c, ' ')}.join
  if deciphered.downcase.include?('north')
    puts "#{sector_id}: #{deciphered}"
    exit
  end
end
puts total
