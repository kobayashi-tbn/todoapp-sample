class AddUserstampsToTodos < ActiveRecord::Migration
  def self.up
    add_userstamps :todos
  end

  def self.down
    remove_userstamps :todos
  end
end
