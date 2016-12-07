def aba(arr)
  matches = []
  arr.split(' ').each{|str| (0..str.length-3).each{|k| matches << str[k..k+2] if str[k] == str[k+2] and str[k..k+2].chars.uniq.size != 1}}
  matches
end

puts File.readlines('code.txt').map(&:chop).count{|ip|
  in_brackets = ip.scan(/\[(.*?)\]/)
  in_brackets.each {|k| ip = ip.sub("[#{k.first}]", ' ')}
  abas = aba(ip)
  abas.size and abas.any?{|aba| in_brackets.flatten.any? {|k| k.include?("#{aba[1]}#{aba[0]}#{aba[1]}")}}
}