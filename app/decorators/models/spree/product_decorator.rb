# frozen_string_literal: true

module Spree
  module ProductDecorator
    def self.prepended(base)
      base.has_many :nonuniq_variant_images,
        source: :variant_images,
        through: :variants_including_master
    end

    def variant_images
      nonuniq_variant_images.distinct
    end

    ::Spree::Product.prepend self
  end
end
