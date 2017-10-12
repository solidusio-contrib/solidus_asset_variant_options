Spree::Image.class_eval do
  attr_accessor :viewable_ids, :validate_variant_presence

  has_many :variant_images, class_name: '::Spree::VariantImage'
  has_many :variants, through: :variant_images

  validates :variants,
    length: { minimum: 1,
              message: 'must have at least one selection',
              if: -> { validate_variant_presence }
            }

  def variant_html_classes
    variant_ids.map { |variant| "tmb-#{variant}"}.join(" ")
  end
end
