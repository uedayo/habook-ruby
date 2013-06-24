class UsersController < ApplicationController

  def index
    @users = User.all(:order => "updated_at DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @user = User.new
    getTwitterJSON(params[:screen_name])
  end

  private
  def getTwitterJSON(screen_name)
  end

end
