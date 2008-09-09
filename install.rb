require 'fileutils'
sample = File.expand_path(File.dirname(__FILE__) + "/samples/skip_selenium_and_coverage.rake")
integration = File.expand_path(RAILS_ROOT + "/lib/tasks/integration.rake")

FileUtils.cp sample, integration