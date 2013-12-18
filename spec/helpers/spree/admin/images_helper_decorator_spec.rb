require 'spec_helper'

describe Spree::Admin::ImagesHelper do
  let(:image) { create :image }
  let(:variant_small) { create :base_variant }
  let(:variant_big) { create :base_variant }

  before do
    image.variant_ids = [variant_small.id, variant_big.id]
  end

  describe '#options_text_for' do
    before do
      viewable = double('viewable')
      viewable.stub(:is_master?) { false }
      image.stub(:viewable) { viewable }
    end

    it 'returns list of classes for variants' do
      pending
      options_text_for(image).should == "tmb-#{variant_small.id} tmb-#{variant_big.id}"
    end
  end
end