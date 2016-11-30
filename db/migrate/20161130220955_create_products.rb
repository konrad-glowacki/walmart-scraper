class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :external_id, required: true
      t.string :name, required: true
      t.decimal :price, precision: 8, scale: 2, required: true
      t.string :url, required: true
      t.timestamps null: false
    end

    add_index :products, :external_id, unique: true
    add_index :products, :url, unique: true
  end
end
