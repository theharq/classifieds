class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :email
      t.text :keywords

      t.timestamps
    end
  end
end
