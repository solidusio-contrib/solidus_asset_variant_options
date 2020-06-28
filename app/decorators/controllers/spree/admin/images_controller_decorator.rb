# frozen_string_literal: true

module Spree
  module Admin
    module ImagesControllerDecorator
      def self.prepended(base)
        base.before_action :set_variants, only: %i[create update]
      end

      private

      def set_variants
        if params[:image][:viewable_ids].present? &&
           params[:image][:viewable_ids].reject(&:blank?).present?
          @image.variant_ids = params[:image][:viewable_ids].reject(&:blank?)
        else #use master variant as falback when empty
          @image.variant_ids = [@product.master.id]
        end
      end

      def set_viewable # viewable remains first variant
        @image.viewable_type = 'Spree::Variant'
        @image.viewable_id = @image.variant_ids.first
      end

      ::Spree::Admin::ImagesController.prepend self
    end
  end
end
