ENV['PLUGINS_TO_TEST'] = "brazilian_rails, email"
ENV['PLUGINS_TO_SPEC'] = "brazilian_rails"
ENV['RAILS_ENV'] = 'development_cache'
ENV['SKIP_TASKS'] = 'test:units, test:functionals, test:integration, test:rcov:units, test:rcov:units:verify, test:rcov:functionals, test:rcov:functionals:verify'
                        
namespace :svn do
  namespace :commit do
    task :after do
      sh "svn commit vendor/plugins/selenium_on_rails"
    end
  end
end