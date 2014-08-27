class ChangePostCategories < ActiveRecord::Migration
  def change
    change_table :post_categories do |t|
      t.integer :category_id, :post_id
      t.timestamps
    end

  end
end
