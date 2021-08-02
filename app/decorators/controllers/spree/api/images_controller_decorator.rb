module Spree
  module Api
    module ImagesControllerDecorator

      def update
        @image = Spree::Image.accessible_by(current_ability, :update).find(params[:id])
        if params[:image][:viewable_ids].present? &&
           params[:image][:viewable_ids].reject(&:blank?).present?
          @image.variant_ids = params[:image][:viewable_ids].reject(&:blank?)
        else #use master variant as falback when empty
          @image.variant_ids = [@product.master.id]
        end
        # reset normal viewable
        @image.viewable_type = 'Spree::Variant'
        @image.viewable_id = @image.variant_ids.first

        @image.update(image_params)
        respond_with(@image, default_template: :show)
      end

      ::Spree::Api::ImagesController.prepend self
    end
  end
end
