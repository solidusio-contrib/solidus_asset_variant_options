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
          @image.variant_ids = [@product.master.id]
        end
        # reset normal viewable
        @image.viewable_type = 'Spree::Variant'
        @image.viewable_id = @image.variant_ids.first
      end

      ::Spree::Api::ImagesController.prepend self
    end
  end
end
