class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :shop, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
