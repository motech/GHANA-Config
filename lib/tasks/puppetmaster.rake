$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "bootstrap_common"

namespace :puppet_master do
  @files_dir = File.expand_path(File.dirname(__FILE__)) + "/../setup"

  desc "sets up puppet master machine"
  task :bootstrap, :node, :user do |task, args|
    file_name = "puppetmaster_add.sh"
    copy_and_execute(@files_dir, file_name, args)
  end

  desc "tears down a puppet master machine"
  task :teardown, :node, :user do |task, args|
    file_name = "puppetmaster_remove.sh"
    copy_and_execute(@files_dir, file_name, args)
  end
end
