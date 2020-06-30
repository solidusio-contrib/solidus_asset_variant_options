# frozen_string_literal: true

module Spree
  module ImageDecorator
    attr_accessor :viewable_ids

    def self.prepended(base)
      base.has_many :variant_images, class_name: '::Spree::VariantImage', dependent: :destroy
      base.has_many :variants, through: :variant_images
    end

    def variant_html_classes
      variant_ids.map { |variant| "tmb-#{variant}" }.join(" ")
    end

    ::Spree::Image.prepend self
  end
end
