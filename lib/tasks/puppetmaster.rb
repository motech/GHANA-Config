class PuppetMaster
  def initialize server, user
    @server = server
    @user = user
  end

  def sign_certificate(node)
    puts "****signing certificate on the puppetmaster..."
    #sign_command = "/usr/sbin/puppetca --color false --sign --all"
    sign_command = "sudo /usr/sbin/puppetca --color false --sign #{node}"
    fail "****error signing certificate on puppetmaster" unless execute(sign_command)
  end

  def remove_certificate(node)
    puts "****node decommissioning succesful.  Removing #{node} from puppet CA"
    remove_command = "sudo /usr/sbin/puppetca --color false --clean #{node}"
    fail "error removing certificate on puppetmaster" unless execute(remove_command)
  end

  def execute(command)
    puts "****executing: #{command}"
    system("ssh -p 12200 -t #{@user}@#{@server} #{command}")
  end
end
