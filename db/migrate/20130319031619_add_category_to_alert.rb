class AddCategoryToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :category_id, :integer
  end
end
