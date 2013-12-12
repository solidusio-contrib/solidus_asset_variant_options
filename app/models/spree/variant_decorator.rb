Spree::Variant.class_eval do
  has_and_belongs_to_many :images, association_foreign_key: :asset_id, class_name: 'Spree::Image'
end
