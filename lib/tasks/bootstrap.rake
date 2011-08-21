$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "bootstrap_common"

namespace :puppet_master do
  @files_dir = File.expand_path(File.dirname(__FILE__)) + "/../setup"

  desc "sets up puppet master machine"
  task :bootstrap, :node, :user do |task, args|
    node, user = validate_args(args)
    file_name = "puppetmaster_add.sh"

    scp("#{@files_dir}/#{file_name}", node, user)
    remote_execute_verify("sudo /bin/bash /tmp/#{file_name}", node, user)
  end

  desc "tears down a puppet master machine"
  task :teardown, :node, :user do |task, args|
    node, user = validate_args(args)
    file_name = "puppetmaster_remove.sh"

    scp("#{@files_dir}/#{file_name}", node, user)
    remote_execute_verify("sudo /bin/bash /tmp/#{file_name}", node, user)
  end
end
