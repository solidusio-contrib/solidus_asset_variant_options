# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "solidus_asset_variant_options"
  s.version     = "1.0.2"
  s.summary     = "Allow an image to belong to multiple Spree::Variant models"
  s.description =
    "Spree makes it tedious to upload the same image across" \
    "multiple variants. This gem solves the problem."
  s.required_ruby_version = ">= 2.1"

  s.author       = "Solidus Team"
  s.email        = "contact@solidus.io"

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = "lib"
  s.requirements << "none"

  s.add_dependency "solidus", ['>= 1.1', '< 3']
  s.add_dependency "solidus_support", "~> 0.3.3"

  s.add_development_dependency "sass-rails"
  s.add_development_dependency "coffee-rails"
  s.add_development_dependency "rails-controller-testing"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "solidus_extension_dev_tools"
end
