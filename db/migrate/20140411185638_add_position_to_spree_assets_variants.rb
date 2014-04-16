class AddPositionToSpreeAssetsVariants < ActiveRecord::Migration
  def change
    add_column :spree_assets_variants, :position, :integer
  end
end
