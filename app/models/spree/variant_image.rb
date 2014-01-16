module Spree
  class VariantImage < ActiveRecord::Base
    self.table_name = :spree_assets_variants
    belongs_to :image, class_name: 'Spree::Image'
    belongs_to :variant, class_name: 'Spree::Variant'
  end
end
