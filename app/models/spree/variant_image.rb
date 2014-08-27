module Spree
  class VariantImage < ActiveRecord::Base
    self.table_name = :spree_assets_variants
    belongs_to :image, class_name: 'Spree::Image'
    belongs_to :variant, class_name: 'Spree::Variant', touch: true

    scope :with_position, -> { where("position IS NOT NULL") }
    default_scope -> { order("#{self.table_name}.position") }

    # on create only just in case there are some lingering in the system
    validates_uniqueness_of :image_id, scope: :variant_id, on: :create
  end
end
