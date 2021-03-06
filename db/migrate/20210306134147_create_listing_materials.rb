class CreateListingMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :listing_materials do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
