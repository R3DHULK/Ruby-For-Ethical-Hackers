require 'socket'

host = ARGV[0]
port = 80
# keep this port on 80 because this is a http banner grabber and http works on port 80

s = TCPSocket.open(host,port)

s.puts("GET / HTTP/1.1\r\n\r\n")

while line = s.gets
  puts line.chop
end
s.close
