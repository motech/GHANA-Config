$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "bootstrap_common"
require "puppetmaster"

namespace :agent do
  @files_dir = File.expand_path(File.dirname(__FILE__)) + "/../setup"

  desc "adds an agent to the collective"
  task :bootstrap do
    file_name = "machine_add.sh"
    node, user, puppetmaster = validate_and_copy(file_name)
    #node, user, puppetmaster = ENV['node'], ENV['user'], ENV['puppetmaster']

    puppet_master = PuppetMaster.new(puppetmaster, user)
    puppet_master.sign_certificate node

    stop_puppet_command = "sudo /sbin/service puppet stop"
    remote_execute(stop_puppet_command, node, user)

    puts "executing first puppet update"
    puppet_update_command = "sudo /usr/sbin/puppetd --no-daemonize --onetime --verbose"
    remote_execute(puppet_update_command, node, user)

    puts "system setup successful!"
  end

  desc "removes an agent from the collective"
  task :teardown do
    file_name = "machine_remove.sh"
    node, user, puppetmaster = validate_and_copy(file_name)

    puppet_master = PuppetMaster.new(puppetmaster, user)
    puppet_master.remove_certificate node
  end
end

def validate_and_copy file_name
  fail "You must specify a puppetmaster" if ENV['puppetmaster'].nil?
  puppetmaster = ENV["puppetmaster"]
  node, user = copy_and_execute @files_dir, file_name, puppetmaster
  return node, user, puppetmaster
end
