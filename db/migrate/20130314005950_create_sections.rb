class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.references :newspaper

      t.timestamps
    end
    add_index :sections, :newspaper_id
  end
end
