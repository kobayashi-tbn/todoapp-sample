class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles do |t|
      t.string :username,             null: false
      t.integer :role_id,             null: false

      t.userstamps
      t.timestamps
    end
    add_index(:users_roles, [:username, :role_id], unique: true)
  end
end
