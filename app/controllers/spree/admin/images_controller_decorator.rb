Spree::Admin::ImagesController.class_eval do
  create.before :set_variants

  def set_viewable
    @image.viewable_type = 'Spree::Variant'
    @image.viewable_id = viewable_ids.first.to_i
  end

  def set_variants
    @image.variant_ids = viewable_ids
  end

  def viewable_ids
    params[:image][:viewable_id].reject(&:blank?)
  end
end