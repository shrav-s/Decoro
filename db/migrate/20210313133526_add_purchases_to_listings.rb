class AddPurchasesToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :purchased, :boolean, default: false
  end
end
