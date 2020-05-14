class CreateHosts < ActiveRecord::Migration[6.0]
  def change
    create_table :hosts do |t|
      t.string :hostname
      t.string :ip
      t.string :operating_system
      t.belongs_to :environment, foreign_key: true

      t.timestamps
    end
  end
end
