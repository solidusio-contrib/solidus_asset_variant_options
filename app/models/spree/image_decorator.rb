Spree::Image.class_eval do
  attr_accessor :viewable_ids

  has_and_belongs_to_many :variants, foreign_key: :asset_id, class_name: 'Spree::Variant'

  def variant_html_classes
    variant_ids.map { |variant| "tmb-#{variant}"}.join(" ")
  end
end
