sample = File.expand_path(File.dirname(__FILE__) + "/samples/skip_selenium_and_coverage.rake")
integration = File.expand_path(RAILS_ROOT + "/lib/tasks/integration.rake")

p sample
p integration
#FileUtils.cp sample, integration