Dir["#{Gem::Specification.find_by_name('integration').full_gem_path}/lib/tasks/*.rake"].each { |ext| load ext } if defined?(Rake)
class Integration
  def self.with_full_coverage!
    if RUBY_VERSION =~ /1.9/ && ENV['COVERAGE'] == 'on'
      require 'simplecov'
      SimpleCov.at_exit do
        if SimpleCov.result.covered_percent < 100
          SimpleCov.result.format!
          exit(1)
        else
          puts  "Congrats! Full code coverage!"
        end
      end
      SimpleCov.start
    end
  end
end
