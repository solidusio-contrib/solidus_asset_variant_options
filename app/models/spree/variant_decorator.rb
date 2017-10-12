Spree::Variant.class_eval do
  has_many :variant_images, -> (object) {
    master = object.product.master
    variant_ids = [object.id, master.id].uniq
    unscope(:where).where(variant_id: variant_ids).order(:variant_id, :position)
  }, class_name: '::Spree::VariantImage'
  has_many :variant_image_images, through: :variant_images, source: :image

  alias_method :images, :variant_image_images
  alias_method :images=, :variant_image_images=
end
