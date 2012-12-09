class CreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles, id: false) do |t|
      t.integer :role_id,             null: false
      t.string :name,            null: false
      t.string :notice

      t.timestamps
    end
    execute "ALTER TABLE roles ADD PRIMARY KEY (role_id)"
  end
end
