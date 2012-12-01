class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.date :limit_on
      t.boolean :done
      t.string :username

      t.timestamps
    end
  end
end
