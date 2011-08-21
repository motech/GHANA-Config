$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "bootstrap_common"

namespace :puppetmaster do
  @files_dir = File.expand_path(File.dirname(__FILE__)) + "/../setup"

  desc "sets up puppet master machine"
  task :bootstrap do
    file_name = "puppetmaster_add.sh"
    copy_and_execute @files_dir, file_name
  end

  desc "tears down a puppet master machine"
  task :teardown do
    file_name = "puppetmaster_remove.sh"
    copy_and_execute @files_dir, file_name
  end
end
