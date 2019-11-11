# frozen_string_literal: true

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
    it "has many images" do
      expect(variant.images.size).to eq(2)
    end
  end

  describe 'images are ordered by variant image positions' do
    # rubocop:disable RSpec/MultipleExpectations
    it "returns the images ordered by variant image position" do
      variant.variant_images.where(image: image_blue).first.update(position: 0)
      variant.variant_images.where(image: image_green).first.update(position: 1)
      variant.images.reload

      expect(variant.images).to eq([image_blue, image_green])

      variant.variant_images.where(image: image_blue).first.update(position: 1)
      variant.variant_images.where(image: image_green).first.update(position: 0)
      variant.images.reload

      expect(variant.images).to eq([image_green, image_blue])
    end
    # rubocop:enable RSpec/MultipleExpectations
  end

  it "cannot associate itself to the same image twice" do
    expect { variant.images << image_green }.to raise_error(
      ActiveRecord::RecordInvalid,
      /Image has already been taken/
    )
  end
end
