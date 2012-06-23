# -*- encoding : utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "integration"
  s.version     = "0.0.1"
  s.description = "A synchronous continuous integration gem."
  s.summary     = "Integration gem help people that want to do synchronous continuous integration on their ruby projects."
  s.authors     = ["Marcos Tapajós", "Sylvestre Mergulhão","Vinícius Teles"]
  s.homepage    = "http://github.com/mergulhao/integration"
  s.files       = Dir["{lib/**/*.rb, lib/**/*.rake, test/**/*.rb,README.mkdn,Rakefile,MIT-LICENSE,*.gemspec}"]
  s.required_rubygems_version = "1.8.0"
  s.add_runtime_dependency('hpricot') if RUBY_VERSION =~ /1.8/
  s.add_runtime_dependency('simplecov') if RUBY_VERSION =~ /1.9/
end
