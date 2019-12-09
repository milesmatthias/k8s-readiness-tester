require 'socket'

INT_SEC=(ENV["INTERVAL_SECONDS"] || 60).to_i

def be_ready
  p "Accepting #{INT_SEC} ready probes..."

  server = TCPServer.new 5678

  for i in 1..INT_SEC do
    session = server.accept
    p "Responding 200 to readiness probe ##{i}..."
		response = "Hello world! The time is #{Time.now}"

		session.print "HTTP/1.1 200 OK\r\n" +
			 "Content-Type: text/plain\r\n" +
			 "Content-Length: #{response.bytesize}\r\n" +
			 "Connection: close\r\n"

		session.print "\r\n"
		session.print response
    sleep(1)
  end

  server.close
end


while true do
  be_ready

  p "Sleeping without a server for #{INT_SEC} seconds..."
  sleep(INT_SEC)
end
