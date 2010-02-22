ENV['PLUGINS_TO_TEST'] = "brazilian_rails, email"
ENV['PLUGINS_TO_SPEC'] = "brazilian_rails"
ENV['RAILS_ENV'] = 'development_cache'

INTEGRATION_TASKS = %w( 
    integration:start
    spec:rcov
    spec:rcov:verify
    integration:finish
)
