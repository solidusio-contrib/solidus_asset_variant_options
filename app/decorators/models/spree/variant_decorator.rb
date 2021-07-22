# frozen_string_literal: true

module Spree
  module VariantDecorator
    def self.prepended(base)
      base.has_many :variant_images, class_name: '::Spree::VariantImage'
      base.has_many :variant_image_images, -> { order(:position) }, through: :variant_images, source: :image

      base.alias_method :images, :variant_image_images
      base.alias_method :images=, :variant_image_images=
    end

    ::Spree::Variant.prepend self
  end
end
