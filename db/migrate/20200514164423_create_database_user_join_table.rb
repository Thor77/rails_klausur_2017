class CreateDatabaseUserJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :databases, :users do |t|
      # t.index [:database_id, :user_id]
      # t.index [:user_id, :database_id]
    end
  end
end
