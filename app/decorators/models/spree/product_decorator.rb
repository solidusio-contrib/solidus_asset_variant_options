module Spree
  module ProductDecorator
    def self.prepended(base)
      base.has_many :nonuniq_variant_images, -> { order(:position) }, source: :variant_images, through: :variants_including_master
    end

    def variant_images
      nonuniq_variant_images.reorder(:position).distinct
    end

    private

    ::Spree::Product.prepend self
  end
end
