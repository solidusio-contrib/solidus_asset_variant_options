require 'spec_helper'

describe Spree::Image do
  let(:image) { create :image }
  let(:variant_small) { create :base_variant }
  let(:variant_big) { create :base_variant }

  before do
    image.variant_ids = [variant_small.id, variant_big.id]
  end

  describe '#variant_html_classes' do
    it 'returns list of classes for variants' do
      image.variant_html_classes.should == "tmb-#{variant_small.id} tmb-#{variant_big.id}"
    end
  end

  describe 'variant relationship' do
    it "should have many variants" do
      image.variants.size.should == 2
    end
  end
end