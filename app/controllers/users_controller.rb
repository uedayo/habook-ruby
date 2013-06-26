require 'json'
require 'open-uri'

class UsersController < ApplicationController

  def index
    @users = User.all(:order => "updated_at DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def twitter
  end

  def search
    @user = User.new
    json = getTwitterJSON(params[:screen_name])
    @user.name = json["name"]
    @user.screen_name = json["screen_name"]
    @user.profile_image_url = json["profile_image_url"]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_path, notice: 'updated!'
    else
      render action: 'edit'
    end
  end

  private
  def getTwitterJSON(screen_name)
    content = open('https://cdn.api.twitter.com/1/users/lookup.json?screen_name=' + screen_name).read
    JSON.parse(content).first
  end

end
