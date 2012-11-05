class AddUserNameToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :username, :string
    add_index :todos, :username
  end
end
