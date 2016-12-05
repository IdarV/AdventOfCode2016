require 'digest'
code = 'cxdnnyjw'
password = ''
index = 0
until password.length == 8 do
  hex = Digest::MD5.hexdigest "#{code}#{index}"
  password += hex[5] if hex.start_with? '00000'
  index += 1
end
p password

