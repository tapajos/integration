require 'fileutils'
sample = File.expand_path(File.dirname(__FILE__) + "/samples/skip_selenium_and_coverage.rake")
integration = File.expand_path(RAILS_ROOT + "/lib/tasks/integration.rake")

FileUtils.cp sample, integration
puts `svn add #{integration}`
puts "Integration rake file (#{integration}) created and added to subversion. If you don't intend to use this file, run:"
puts "svn remove #{integration}"
