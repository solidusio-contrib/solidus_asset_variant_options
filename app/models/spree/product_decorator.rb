Spree::Product.class_eval do
  has_many :nonuniq_variant_images, -> { order(:position) }, source: :images, through: :variants_including_master

  def variant_images
    variant_images = Spree::VariantImage.where(variant_id: variant_ids)
    Spree::Image.where(id: variant_images.pluck(:image_id), viewable_type: 'Spree::Variant')
  end
end
