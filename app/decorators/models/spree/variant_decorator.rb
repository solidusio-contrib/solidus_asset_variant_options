Spree::Variant.class_eval do
  has_many :variant_images, -> { order(:position) }, class_name: '::Spree::VariantImage'
  has_many :variant_image_images, through: :variant_images, source: :image

  alias_method :images, :variant_image_images
  alias_method :images=, :variant_image_images=
end
