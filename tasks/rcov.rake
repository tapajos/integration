require 'rake/clean'
require 'find'

RCOV_OUT = "coverage"

EXCLUDE = "-x lib/ysearch.* -x /site_ruby/ -x .*gems.*"

EXCLUDE_FUNCTIONAL = EXCLUDE + " -x .*lib.* -x .*model.* -x .*helpers.* -x application.rb"

CLOBBER.include(RCOV_OUT)

RCOV = "rcov --no-color"


def find_source(sub_directory)
  result = []
  Find.find("#{RAILS_ROOT}/#{sub_directory}") do |file_name|
    result << file_name if file_name =~ /.*\.rb$/
  end
  result.join(" ")
end


namespace :test do
  namespace :rcov do
    desc "generate a unit test coverage report in coverage/unit; see coverage/unit/index.html afterwards"
    task :units do
      sh "#{RCOV} #{find_source('test/unit')} #{EXCLUDE} --rails --output #{RCOV_OUT}"
    end

    desc "generate a functional test coverage report in coverage/functional; see coverage/functional/index.html afterwards"
    task :functionals do
      sh "#{RCOV} #{find_source('test/functional')} #{EXCLUDE_FUNCTIONAL} --rails --output #{RCOV_OUT}"
    end

    desc "generate a coverage report for unit and functional tests together in coverage/all; see coverage/all/index.html afterwards"
    task :all do
      sh "#{RCOV} #{find_source('test')} #{EXCLUDE} --rails --output #{RCOV_OUT}"
    end
  end
end