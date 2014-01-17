SpreeAssetVariantOptions
========================

This is a fork of:

https://github.com/jpdesigndev/spree_asset_variant_options

Installation
------------

Add spree_asset_variant_options to your Gemfile:

```ruby
gem 'spree_asset_variant_options',  :git => 'https://github.com/bonobos/spree_asset_variant_options.git'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_asset_variant_options:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_asset_variant_options/factories'
```

Copyright (c) 2013 [jpdesigndev], released under the New BSD License
