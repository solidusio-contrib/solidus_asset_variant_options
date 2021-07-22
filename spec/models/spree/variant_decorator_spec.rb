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

  it "cannot associate itself to the same image twice" do
    expect { variant.images << image_green }.to raise_error(
      ActiveRecord::RecordInvalid,
      /Image has already been taken/
    )
  end
end
