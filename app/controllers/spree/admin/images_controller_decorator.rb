Spree::Admin::ImagesController.class_eval do
  new_action.before :set_default_variants
  create.before     :set_variants
  update.before     :set_variants

  private

    def set_default_variants
      @image.variant_ids = [@product.id]
    end

    def set_variants
      @image.validate_variant_presence = true
      @image.variant_ids = viewable_ids
    end

    def viewable_ids
      # If viewable_ids is blank fall back to viewable_id
      #
      # This allows the existing drag / drop image upload form to continue to
      # function with no additional modifications
      #
      if params[:image][:viewable_ids].nil? && params[:image][:viewable_id].present?
        params[:image][:viewable_ids] = [params[:image][:viewable_id]]
      end

      params[:image][:viewable_ids].reject(&:blank?)
    end
end
