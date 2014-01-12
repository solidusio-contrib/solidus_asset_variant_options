Spree::Product.class_eval do
  has_many :variant_images, -> { order(:position) }, source: :images, through: :variants_including_master
end
