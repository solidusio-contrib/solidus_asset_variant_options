class AddIdToSpreeAssetsVariants < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_assets_variants, :id, :primary_key
    rename_column :spree_assets_variants, :asset_id, :image_id
  end
end
