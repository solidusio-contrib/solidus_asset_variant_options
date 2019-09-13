module SpreeAssetVariantOptions
  class Engine < Rails::Engine
    require "spree/core"
    isolate_namespace Spree
    engine_name "solidus_asset_variant_options"

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/decorators/**/*.rb")) do |c|
        require_dependency(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
