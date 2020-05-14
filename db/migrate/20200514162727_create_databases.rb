class CreateDatabases < ActiveRecord::Migration[6.0]
  def change
    create_table :databases do |t|
      t.string :name
      t.text :description
      t.belongs_to :host

      t.timestamps
    end
  end
end
