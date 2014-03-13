class AddProductCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_category, :string
  end
end
