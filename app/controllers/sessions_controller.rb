class SessionsController < ApplicationController
  before_filter :user_finder, :only => [:create]

  def new
    
  end

  def create
    @user = user_finder
    if @user
      sign_in(@user)
      redirect_to root_path
    else
      flash[:error] = "Error"
      render :new
    end
  end

  def destroy
    sign_out
  end
end
