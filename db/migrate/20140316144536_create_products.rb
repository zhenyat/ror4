class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string  :name
      t.string  :sku
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
