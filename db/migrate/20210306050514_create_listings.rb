class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
