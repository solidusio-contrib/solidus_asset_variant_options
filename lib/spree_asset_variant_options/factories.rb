FactoryGirl.define do
  factory :image, class: Spree::Image do
    attachment File.open(File.expand_path("../../../spec/support/images/green.jpeg", __FILE__))
  end
end
