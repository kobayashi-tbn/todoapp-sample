require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup :todo_prepare

  def todo_prepare
    @user = User.new(:username => "test_user")
    Thread.current[:username] = "test_user"
    @todo = Todo.new(:title => "test todo", :description => "test description")
    @todo.user = @user
    @todo.save
  end

  test "create with created_by and updated_by" do
    id = @todo.id
    todo = Todo.find(id)
    p todo
    assert_equal(todo.created_by, "test_user")
    assert_equal(todo.updated_by, "test_user")
  end

  test "update with updated_by" do
    Thread.current[:username] = "test_user2"

    id = @todo.id
    todo = Todo.find(id)
    todo.description = todo.description << " update"
    todo.save
    assert_equal(todo.created_by, "test_user")
    assert_equal(todo.updated_by, "test_user2")
  end

  test "use named scope found case" do
    Thread.current[:username] = "test_user"
    todos = Todo.by_user(@user)
    assert_equal(todos.size, 1)
  end

  test "use named scope not found case" do
    Thread.current[:username] = "test_user"

    other = User.new(:username => "other")
    todos = Todo.by_user(other)
    assert_equal(todos.size, 0)
  end
end
