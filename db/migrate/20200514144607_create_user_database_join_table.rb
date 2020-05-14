class CreateUserDatabaseJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :databases do |t|
      t.index [:user_id, :database_id]
      t.index [:database_id, :user_id]
    end
  end
end
