class RemoveMaterialFromListings < ActiveRecord::Migration[6.1]
  def change
    remove_reference :listings, :material, null: false, foreign_key: true
  end
end
