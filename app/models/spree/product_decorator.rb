Spree::Product.class_eval do
  has_many :variant_images, source: :images, through: :variants_including_master, order: 'spree_assets.position', select: 'spree_assets.*, spree_assets.position, spree_variants.position', uniq: true
end
