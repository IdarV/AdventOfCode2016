require 'digest'
code = 'cxdnnyjw'
pwd = []
index = 0
until pwd.compact.size == 8 do
  hex = Digest::MD5.hexdigest "#{code}#{index}"
  pwd[hex[5].to_i] = hex[6] if hex.start_with? '00000' and hex[5].between?('0', '7') and pwd[hex[5].to_i].nil?
  index += 1
end
puts pwd.join