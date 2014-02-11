require 'spec_helper'

describe Spree::Product do
  let(:product) { create :product }
  let(:variant) { create :base_variant, product: product }
  let(:image_green) { create :image, viewable_type: 'Spree::Variant' }
  let(:image_blue) { create :image, viewable_type: 'Spree::Variant' }

  before do
    variant.images << image_green
    variant.images << image_blue
    variant.save
  end

  describe '#variant_images' do
    it 'returns unique list of variant images' do
      product.reload.variant_images.size.should == 2
    end
  end

end
