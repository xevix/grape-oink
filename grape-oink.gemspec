Gem::Specification.new do |s|
  s.name        = 'grape-oink'
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Alejandro Wainzinger']
  s.email       = ['alejandro.wainzinger@gmail.com']
  s.homepage    = 'https://github.com/xevix/grape-oink'
  s.summary     = %q{A middleware for Grape to allow working with Oink.}
  s.description = %q{A middleware for Grape to allow working with Oink.}
  s.license     = 'MIT'

  s.add_development_dependency 'grape', '= 0.10.0'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'bundler'

  s.files = ["lib/grape-oink.rb", "lib/grape/middleware/oink_middleware.rb"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']
end
