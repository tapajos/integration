require 'fileutils'
sample = File.expand_path(File.dirname(__FILE__) + "/samples/all_tasks.rake")
integration = File.expand_path(RAILS_ROOT + "/lib/tasks/integration.rake")

FileUtils.cp sample, integration