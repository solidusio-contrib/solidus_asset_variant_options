require 'spec_helper'

describe Spree::Variant do
  let(:variant) { create :base_variant }
  let(:image_green) { create :image }
  let(:image_blue) { create :image }

  before do
    variant.images << image_green
    variant.images << image_blue
  end

  describe 'variant relationship' do
    it "should have many images" do
      variant.images.size.should == 2
    end
  end
end
