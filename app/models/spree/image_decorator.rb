Spree::Image.class_eval do
  has_and_belongs_to_many :variants, foreign_key: :asset_id, class_name: 'Spree::Variant'
end
