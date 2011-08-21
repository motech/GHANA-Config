$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "bootstrap_common"

namespace :agent do
  @files_dir = File.expand_path(File.dirname(__FILE__)) + "/../setup"

  desc "adds an agent to the collective"
  task :bootstrap do
    file_name = "machine_add.sh"
    validate_and_copy(file_name)
  end

  desc "removes an agent from the collective"
  task :teardown do
    file_name = "machine_remove.sh"
    validate_and_copy(file_name)
  end
end

def validate_and_copy file_name
  fail "You must specify a puppetmaster" if ENV['puppetmaster'].nil?
  puppetmaster = ENV["puppetmaster"]

  copy_and_execute @files_dir, file_name, puppetmaster
end
