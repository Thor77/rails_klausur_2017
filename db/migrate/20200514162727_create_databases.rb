class CreateDatabases < ActiveRecord::Migration[6.0]
  def change
    create_table :databases do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end