class CreateDatabaseHostJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :databases, :hosts do |t|
      # t.index [:database_id, :host_id]
      # t.index [:host_id, :database_id]
    end
  end
end
