class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :item_id, required: true
      t.string :name, required: true
      t.decimal :price, precision: 8, scale: 2, required: true
      t.timestamps null: false
    end

    add_index :products, :item_id, unique: true
  end
end
