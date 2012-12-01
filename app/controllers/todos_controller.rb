class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    #@todos = Todo.all
    @todos = Todo.by_user(current_user).order(:limit_on)
    @size_all = @todos.size
    todo_complete = @todos.select{|todo| todo.done}
    @size_complete = todo_complete.size
    @size_incomplete = @size_all - @size_complete
    if (params[:all])
      #@todos = Todo.by_user(current_user).order(:limit_on)
    elsif (params[:complete])
      @todos = todo_complete #Todo.complete.by_user(current_user).order(:limit_on)
    else
      @todos -= todo_complete #Todo.incomplete.by_user(current_user).order(:limit_on)
    end


    puts session

    respond_to do |format|
      format.html # index.html.erb
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
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])
    @todo.user = current_user

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    done = @todo.done
    @todo.destroy
    if done
      @todos = Todo.by_user(current_user).order(:limit_on)
    else
      @todos = Todo.incomplete.by_user(current_user).order(:limit_on)
    end
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.js
      format.json { head :no_content }
    end
  end
end
