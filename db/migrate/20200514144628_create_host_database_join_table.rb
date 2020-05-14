class CreateHostDatabaseJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :hosts, :databases do |t|
      t.index [:host_id, :database_id]
      t.index [:database_id, :host_id]
    end
  end
end
