def bad1
  # ruleid: net-telnet-request
  localhost = Net::Telnet::new("Host" => "localhost",
                              "Timeout" => 10,
                              "Prompt" => /[$%#>] \z/n)
  localhost.login("username", "password") { |c| print c }
  localhost.cmd("command") { |c| print c }
  localhost.close
end

def bad2
  # ruleid: net-telnet-request
  pop = Net::Telnet::new("Host" => "your_destination_host_here",
                        "Port" => 110,
                        "Telnetmode" => false,
                        "Prompt" => /^\+OK/n)
  pop.cmd("user " + "your_username_here") { |c| print c }
  pop.cmd("pass " + "your_password_here") { |c| print c }
  pop.cmd("list") { |c| print c }
end

def bad3
  # ruleid: net-telnet-request
  s = Net::SSH::Telnet.new(
        "Dump_log" => "/dev/stdout",
        "Session" => ssh
  )
  puts "Logged in"
  p s.cmd("echo hello")
end

def ok1
  # ok: net-telnet-request
  Net::SSH.start("host", "user", password: "password") do |ssh|
    result = ssh.exec!("ls -l")
    puts result
  end
end
