chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + ['!', '@', '#', '$', '%', '^', '&', '*']

puts "Enter the length of the password: "
length = gets.chomp.to_i

password = Array.new(length) { chars.sample }.join

puts "Password: #{password}"
