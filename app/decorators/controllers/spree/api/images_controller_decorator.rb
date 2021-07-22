# frozen_string_literal: true

module Spree
  module Api
    module ImagesControllerDecorator
      def self.prepended(base)
        base.after_action :set_variants, only: %i[create update]
      end

      private

      def set_variants
        if params[:image][:viewable_ids].present? &&
           params[:image][:viewable_ids].reject(&:blank?).present?
          @image.variant_ids = params[:image][:viewable_ids].reject(&:blank?)
        else #use master variant as falback when empty
          # when only updating an attribute of the image (like 'alt') and not sending
          # any viewables along, don't overwrite the existing ones
          if @image.variant_ids.empty?
            variant = scope.try(:master) || scope
            @image.variant_ids = [variant.id]
          end
        end
        # reset normal viewable
        @image.viewable_type = 'Spree::Variant'
        @image.viewable_id = @image.variant_ids.first
      end

      ::Spree::Api::ImagesController.prepend self
    end
  end
end
