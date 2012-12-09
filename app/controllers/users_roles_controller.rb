class UsersRolesController < ApplicationController
  # GET /users_roles
  # GET /users_roles.json
  def index
    @users_roles = UsersRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users_roles }
    end
  end

  # GET /users_roles/1
  # GET /users_roles/1.json
  def show
    @users_role = UsersRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @users_role }
    end
  end

  # GET /users_roles/new
  # GET /users_roles/new.json
  def new
    @users_role = UsersRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @users_role }
    end
  end

  # GET /users_roles/1/edit
  def edit
    @users_role = UsersRole.find(params[:id])
  end

  # POST /users_roles
  # POST /users_roles.json
  def create
    @users_role = UsersRole.new(params[:users_role])

    respond_to do |format|
      if @users_role.save
        format.html { redirect_to @users_role, notice: 'Users role was successfully created.' }
        format.json { render json: @users_role, status: :created, location: @users_role }
      else
        format.html { render action: "new" }
        format.json { render json: @users_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users_roles/1
  # PUT /users_roles/1.json
  def update
    @users_role = UsersRole.find(params[:id])

    respond_to do |format|
      if @users_role.update_attributes(params[:users_role])
        format.html { redirect_to @users_role, notice: 'Users role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @users_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_roles/1
  # DELETE /users_roles/1.json
  def destroy
    @users_role = UsersRole.find(params[:id])
    @users_role.destroy

    respond_to do |format|
      format.html { redirect_to users_roles_url }
      format.json { head :no_content }
    end
  end
end
