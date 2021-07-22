# frozen_string_literal: true

module Spree
  module Gallery
    module ProductGalleryDecorator
      attr_accessor :viewable_ids

      def self.prepended(base)
        def images
          @images ||= Spree::Image.where(id: @product.variant_images.distinct(false).select(:image_id).group(:image_id).unscope(:order).map(&:image_id))
        end
      end

      ::Spree::Gallery::ProductGallery.prepend self
    end
  end
end
