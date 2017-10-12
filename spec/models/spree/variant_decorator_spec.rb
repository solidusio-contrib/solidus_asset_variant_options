require 'spec_helper'

describe Spree::Variant do
  let(:variant) { create :base_variant }
  let(:image_green) { create :image }
  let(:image_blue) { create :image }

  before do
    Spree::VariantImage.create!(variant: variant, image: image_green)
    Spree::VariantImage.create!(variant: variant, image: image_blue)
    variant.reload
    # variant.images << image_green
    # variant.images << image_blue
  end

  describe 'variant relationship' do
    it "should have many images" do
      expect(variant.images.size).to eq(2)
    end
  end

  describe 'images are ordered by variant image positions' do
    it "returns the images ordered by variant image position" do
      variant.variant_images.where(image: image_blue).first.update_attributes(position: 0)
      variant.variant_images.where(image: image_green).first.update_attributes(position: 1)

      expect(variant.images.first).to eq image_blue
      expect(variant.images.last).to eq image_green

      variant.variant_images.where(image: image_blue).first.update_attributes(position: 1)
      variant.variant_images.where(image: image_green).first.update_attributes(position: 0)
      variant.reload

      expect(variant.images.first).to eq image_green
      expect(variant.images.last).to eq image_blue
    end
  end

  it "cannot associate itself to the same image twice" do
    expect {
      variant.images << image_green
    }.to raise_error ActiveRecord::RecordInvalid, /Image has already been taken/
  end

  describe '#images' do
    subject { variant.images }

    context 'when master variant has images' do
      let(:product) { variant.product }
      let(:master_variant) { product.master }
      let(:image_red) { create :image }

      before do
        master_variant.images << image_red
      end

      it 'should include master variant images' do
        expect(variant.images.size).to eq(3)
      end
    end
  end
end
