require 'socket'

def scan(host, port)
  begin
    s = TCPSocket.new(host, port)
    puts " [+] Port #{port} is open"
    s.close
  rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
    puts " [-] Port #{port} is closed"
  end
end

# usage
host = "127.0.0.1"
ports = (1..65535).to_a
ports.each { |port| scan(host, port) }
