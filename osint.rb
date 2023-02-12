require 'net/http'

print "Enter a search term: "
term = gets.chomp

# Perform a Google search for the search term
uri = URI("https://www.google.com/search?q=#{term}")
response = Net::HTTP.get_response(uri)

# Print the response status and header information
puts "Response status: #{response.code} #{response.message}"
response.each_header do |key, value|
  puts "#{key}: #{value}"
end
