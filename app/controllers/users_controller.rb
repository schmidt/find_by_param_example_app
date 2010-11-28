class UsersController < ApplicationController
  def index
    @users = User.find(:all)
  end

  def show
    @user = User.find_by_param!(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user"
      redirect_to(users_path)
    else
      flash.now[:error] = "Something went wrong"
      render :action => "new"
    end
  end

  def edit
    @user = User.find_by_param(params[:id])
  end
  
  def update
    @user = User.find_by_param(params[:id])
    @user.update_attributes(params[:user])

    if @user.save
      flash[:notice] = "Successfully saved"
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Something went wrong"
      render :action => "edit"
    end
  end
end
