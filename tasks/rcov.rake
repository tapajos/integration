require 'rake/clean'

RCOV_OUT = "coverage"

EXCLUDE = "-x lib/ysearch.* -x /site_ruby/ -x .*gems.*"

EXCLUDE_FUNCTIONAL = EXCLUDE + " -x .*lib.* -x .*model.* -x .*helpers.* -x application.rb"

CLOBBER.include(RCOV_OUT)

RCOV = "rcov --no-color"

namespace :test do
  namespace :rcov do
    desc "generate a unit test coverage report in coverage/unit; see coverage/unit/index.html afterwards"
    task :units do
      sh "find test/unit -name '*.rb' | xargs #{RCOV} #{EXCLUDE} --rails --output #{RCOV_OUT}"
    end

    desc "generate a functional test coverage report in coverage/functional; see coverage/functional/index.html afterwards"
    task :functionals do
      sh "find test/functional -name '*.rb' \! -name 'coverage_test.rb' | xargs #{RCOV} #{EXCLUDE_FUNCTIONAL} --rails --output #{RCOV_OUT}"
    end

    desc "generate a coverage report for unit and functional tests together in coverage/all; see coverage/all/index.html afterwards"
    task :all do
      sh "find test/* -name '*.rb' \! -name 'coverage_test.rb' | xargs #{RCOV} #{EXCLUDE} --rails --output #{RCOV_OUT}"
    end
  end
end