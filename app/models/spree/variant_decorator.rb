Spree::Variant.class_eval do
  has_many :variant_images, -> { order(:position) }, class_name: '::Spree::VariantImage'
  has_many :images, through: :variant_images, source: :image
end
