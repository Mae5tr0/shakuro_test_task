class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :publisher, index: true

      t.timestamps
    end
  end
end
