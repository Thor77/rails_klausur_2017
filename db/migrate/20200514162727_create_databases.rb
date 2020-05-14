class CreateDatabases < ActiveRecord::Migration[6.0]
  def change
    create_table :databases do |t|
      t.string :name
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end
