# frozen_string_literal: true

module Spree
  module Gallery
    module ProductGalleryDecorator
      attr_accessor :viewable_ids

      def self.prepended(base)
        def images
          @images ||= @product.variant_images.collect { |vi| vi.image }.uniq
        end
      end

      ::Spree::Gallery::ProductGallery.prepend self
    end
  end
end
