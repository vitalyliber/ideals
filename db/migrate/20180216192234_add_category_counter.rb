class AddCategoryCounter < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :products_count, :integer, default: 0

    Category.all.each do |el|
      Category.update_counters el.id, products_count: el.products.length
    end
  end
end
