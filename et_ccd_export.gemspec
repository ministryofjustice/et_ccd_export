$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "et_ccd_export/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "et_ccd_export"
  s.version     = EtCcdExport::VERSION
  s.authors     = ["Gary Taylor"]
  s.email       = ["gary.taylor@hmcts.net"]
  s.homepage    = ""
  s.summary     = "Summary of EtCcdExport."
  s.description = "Description of EtCcdExport."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
  s.add_dependency 'addressable', '~> 2.5', '>= 2.5.2'
  s.add_dependency 'jbuilder', '2.7.0'
  s.add_dependency 'rotp', '~> 5.0'

  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails', '~> 3.8'
  s.add_development_dependency 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock', '~> 3.5', '>= 3.5.1'
end
