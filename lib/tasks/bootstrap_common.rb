def validate_args
  fail "No node specified" if ENV['node'].nil?
  fail "You must specify a user to run this command as" if ENV['user'].nil?
  return ENV['node'], ENV['user']
end

def scp(files, node, user)
  scp_command = "scp -P 12200 #{files} #{user}@#{node}:/tmp"
  puts "Secure copy: #{scp_command}"
  fail "error copying file: #{files} to target system" unless system(scp_command)
end

def remote_execute_verify(command, node, user)
  fail "#{command} execution failed remotely - check the output for details" unless remote_execute(command, node, user)
end

def remote_execute(command, node, user)
  remote_execute_command = "ssh -p 12200 -t #{node} -l #{user} \"#{command}\""
  puts "Executing: #{remote_execute_command}"
  system(remote_execute_command)
end

def copy_and_execute files_dir, file_name, args=""
  node, user = validate_args
  file = "#{files_dir}/#{file_name}"
  command = "sudo /bin/bash /tmp/#{file_name} #{args}"
  scp(file, node, user)
  remote_execute_verify(command, node, user)
  return node, user
end
