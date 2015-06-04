Spree::Product.class_eval do
  has_many :nonuniq_variant_images, -> { order(:position) }, source: :images, through: :variants_including_master

  def variant_images
    nonuniq_variant_images.distinct
  end
end
