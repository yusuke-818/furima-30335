class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string :item 
      t.text :info
      t.integer :category_id 
      t.integer :states_id 
      t.integer :shipping_id
      t.integer :prefecture_id
      t.integer :shipping_days_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps 
    end
  end
end
