Spree::Admin::ImagesHelper.class_eval do
  alias :original_options_text_for :options_text_for

  def options_text_for image
    if image.variants.any?
      image.variants.map { |variant| variant.sku_and_options_text }.join('; ')
    else
      original_options_text_for image
    end
  end
end