class CreateJoinTableShopBook < ActiveRecord::Migration[5.2]
  def change
    create_join_table :shops, :books do |t|
      t.index [:shop_id, :book_id]

      t.integer :amount
    end
  end
end
