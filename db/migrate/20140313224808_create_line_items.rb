class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.float :price
      t.references :product, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
