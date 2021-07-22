# frozen_string_literal: true

module Spree
  module Admin
    module ImagesControllerDecorator
      def self.prepended(base)
        base.before_action :set_variants, only: %i[create update]
      end

      # # update variant image positions the same way like image positions
      # # TODO: find more meaningful way to use variant image positions when showing images
      # def update_positions
      #   ActiveRecord::Base.transaction do
      #     params[:positions].each do |id, index|
      #       img = Spree::Image.find(id)
      #       img.set_list_position(index)
      #       # img.variant_images.each do |vi|
      #       #   vi.update_column(:position, img.position)
      #       # end
      #     end
      #   end

      #   respond_to do |format|
      #     format.js { head :no_content }
      #   end
      # end

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
