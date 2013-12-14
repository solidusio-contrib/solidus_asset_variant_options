require 'spec_helper'

describe Spree::Product do
  let(:product) { create :product }
  let(:variant) { create :base_variant, product_id: product.id }
  let(:image_green) { create :image }
  let(:image_blue) { create :image }

  before do
    variant.image_ids = [image_green.id, image_blue.id]
  end

  describe '#variant_images' do
    it 'returns unique list of variant images' do
      product.variant_images.size.should == 2
    end
  end

end