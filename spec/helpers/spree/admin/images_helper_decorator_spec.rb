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
      allow(viewable).to receive(:is_master?) { false }
      allow(image).to receive(:viewable) { viewable }
    end

    it 'returns list of classes for variants' do
      skip
      expect(options_text_for(image)).to eq("tmb-#{variant_small.id} tmb-#{variant_big.id}")
    end
  end
end
