require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in @user

    post :create
    @todo = todos(:one)
    @todo2 = todos(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post :create, todo: { description: @todo.description, done: @todo.done, limit_on: @todo.limit_on, title: @todo.title, username: @user.username }
    end

    assert_redirected_to todo_path(assigns(:todo))
  end

  test "should show todo" do
    get :show, id: @todo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @todo
    assert_response :success
  end

  test "should update todo" do
    put :update, id: @todo2, todo: { description: @todo2.description << " update", done: @todo2.done, limit_on: @todo2.limit_on, title: @todo2.title }
    assert_redirected_to todo_path(assigns(:todo))
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete :destroy, id: @todo
    end

    assert_redirected_to todos_path
  end
end
