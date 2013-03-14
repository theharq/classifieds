class ChangeColumTypeToClassified < ActiveRecord::Migration

  def up
    change_column :classifieds, :content, :text
  end

  def down
    change_column :classifieds, :content, :string
  end

end
