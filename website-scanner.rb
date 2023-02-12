require 'net/http'

def scan(url, file)
  uri = URI(url + file)
  response = Net::HTTP.get_response(uri)

  if response.code == "200"
    puts "   ✔️✔️ #{file} found at #{url} ✔️✔️"
  else
    puts " ✖️✖️ #{file} not found at #{url} ✖️✖️"
  end
end

# usage
puts " [*] Enter the website URL (e.g. http://example.com):"
url = gets.chomp
files = ["/index.html", "/secret_file.txt"]
files.each { |file| scan(url, file) }
