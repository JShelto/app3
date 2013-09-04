class UsersController < ApplicationController

  def new 
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      flash[:error] = "Error"
      render :new
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to root_path
  end
end