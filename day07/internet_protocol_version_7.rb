def abba(str)
  (0..str.length-4).each{|k| return true if "#{str[k..k+1]}" == "#{str[k+2..k+3].reverse}" and str[k..k+3].chars.uniq.size != 1}
  false
end

puts File.readlines('code.txt').map(&:chop).count{ |ipa|
  hypernet = ipa.scan(/\[(.*?)\]/)
  hypernet.each{|k| ipa = ipa.sub("[#{k.first}]", ' ') }
  ipa.split(' ').any?{|k| abba k} and hypernet.flatten.none?{|k| abba k}
}