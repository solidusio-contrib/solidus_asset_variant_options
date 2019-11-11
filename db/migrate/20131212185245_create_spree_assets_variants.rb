# frozen_string_literal: true

class CreateSpreeAssetsVariants < SolidusSupport::Migration[4.2]
  def change
    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table :spree_assets_variants, id: false do |t|
      t.references :asset, index: true
      t.references :variant, index: true
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
  end
end
