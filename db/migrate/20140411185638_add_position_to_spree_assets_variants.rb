# frozen_string_literal: true

class AddPositionToSpreeAssetsVariants < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_assets_variants, :position, :integer
  end
end
