class AddFieldsToClassified < ActiveRecord::Migration
  def change
    add_column :classifieds, :category_id, :integer
    add_index :classifieds, :category_id
  end
end
