class TodosController < ApplicationController
  before_filter :prepare_todos, only: [:index]
  before_filter :prepare_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    if (session[:todo_list_cond] == 'all')
      # no op
    elsif (session[:todo_list_cond] == 'complete')
      @todos = @todos_complete
    else
      @todos -= @todos_complete
    end

    puts session

    respond_to do |format|
      format.html # index.html.erb
      format.mobile # index.mobile.erb
      format.js   # for ajax
      format.json { render json: @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    #@todo = Todo.find(params[:id])
    @todo = Todo.by_user(current_user).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.mobile # show.moble.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = Todo.new
    @todo.limit_on = Time.now.strftime('%Y-%m-%d')

    respond_to do |format|
      format.html # new.html.erb
      format.mobile # new.mobile.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    #@todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])
    @todo.user = current_user

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.mobile { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { render action: "new" }
        format.mobile { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    #@todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.mobile { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.mobile { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    prepare_todos

    if session[:todo_list_cond] == :all
      # no op
    elsif session[:todo_list_cond] == :complete
      @todos = @todos_complete
    else
      @todos -= @todos_complete
    end

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.mobile { redirect_to todos_url }
      format.js
      format.json { head :no_content }
    end
  end

  private

  def prepare_todo
    begin
      @todo = Todo.by_user(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to todos_url, notice: I18n.t(".data_not_found", data_name: 'Todo')
    end
  end

  def prepare_todos
    session[:todo_list_cond] = params[:todo_list_cond] if params[:todo_list_cond]

    @todos = Todo.by_user(current_user).order(:limit_on)
    @size_all = @todos.size
    @todos_complete = @todos.select{|todo| todo.done}
    @size_complete = @todos_complete.size
    @size_incomplete = @size_all - @size_complete
  end

end
