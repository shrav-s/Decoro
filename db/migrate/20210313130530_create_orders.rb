class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.string :payment_intent_id
      t.string :receipt_url

      t.timestamps
    end
  end
end
