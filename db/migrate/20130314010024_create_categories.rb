class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :url
      t.references :section

      t.timestamps
    end
    add_index :categories, :section_id
  end
end
