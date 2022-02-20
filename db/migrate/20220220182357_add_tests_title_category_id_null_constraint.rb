class AddTestsTitleCategoryIdNullConstraint < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :category_id, :integer
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :category_id, false)
  end
end
