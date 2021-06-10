# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_asset_variant_options/version'

Gem::Specification.new do |s|
  s.name = 'solidus_asset_variant_options'
  s.version = SolidusAssetVariantOptions::VERSION
  s.summary = 'Allow an image to belong to multiple Spree::Variant models'
  s.description =
    'Spree makes it tedious to upload the same image across' \
    'multiple variants. This gem solves the problem.'
  s.license = 'BSD-3-Clause'

  s.author = 'Solidus'
  s.email = 'contact@solidus.io'
  s.homepage = 'https://github.com/solidusio-contrib/solidus_asset_variant_options'

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
  end

  s.required_ruby_version = '~> 2.4'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'solidus_core', ['>= 2.0.0', '< 4']
  s.add_dependency 'solidus_support', '~> 0.8'

  s.add_development_dependency 'solidus_dev_support'
end
