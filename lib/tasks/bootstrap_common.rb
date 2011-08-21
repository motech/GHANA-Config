DEFAULT_SSH_PORT = 22

def validate_args(args)
  fail "No node specified" if args[:node].nil?
  fail "You must specify a user to run this command as" if args[:user].nil?
  return "#{args[:node]}", "#{args[:user]}"
end

def scp(files, node, user)
  scp_command = "scp #{files} #{user}@#{node}:/tmp"
  puts "Secure copy: #{scp_command}"
  fail "error copying file: #{files} to target system" unless system(scp_command)
end

def remote_execute_verify(command, node, user)
  fail "#{command} execution failed remotely - check the output for details" unless remote_execute(command, node, user)
end

def remote_execute(command, node, user)
  remote_execute_command = "ssh -t #{node} -l #{user} \"#{command}\""
  puts "Executing: #{remote_execute_command}"
  system(remote_execute_command)
end
