Spree::Admin::ImagesController.class_eval do
  create.before :set_variants
  update.before :set_variants

  private

    def set_variants
      @image.variant_ids = viewable_ids
    end

    def viewable_ids
      params[:image][:viewable_ids].reject(&:blank?)
    end
end