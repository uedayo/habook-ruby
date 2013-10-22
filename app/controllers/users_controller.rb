# coding: utf-8

require 'json'
require 'open-uri'

class UsersController < ApplicationController

  def index
    @users = User.all(:order => "read_count DESC")
  end

  def show
    @user = User.find_by_screen_name(params[:id])
  end

  def new
    @user = User.new
  end

  def create_twitter
    @user = User.new
    json = getTwitterJSON(params[:screen_name])
    @user.name = json["name"]
    @user.screen_name = json["screen_name"]
    @user.profile_image_url = json["profile_image_url"]
  end

  def create_name
    @user = User.new(name: params[:name], profile_image_url: "https://si0.twimg.com/profile_images/1649681615/kihon_a_01_bigger.jpg", screen_name: getRandomUserID, read_count: 0, reading_count: 0)
    if @user.save
      flash.keep[:notice] = $notice_add_success
      redirect_to users_path
    else
      render action: 'new'
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash.keep[:notice] = $notice_add_success
      redirect_to users_path
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find_by_screen_name(params[:id])
  end

  def update
    @user = User.find_by_screen_name(params[:id])
    if @user.update_attributes(params[:user])
      flash.keep[:notice] = $notice_update_success
      redirect_to users_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = User.find_by_screen_name(params[:id])
    @user.destroy
    flash.keep[:notice] = $notice_delete_success
    redirect_to users_path, notice: $notice_delete_success
  end

  private
  def getTwitterJSON(screen_name)
    content = open('https://cdn.api.twitter.com/1/users/lookup.json?screen_name=' + screen_name).read
    JSON.parse(content).first
  end

  def getRandomUserID
    a = ('a'..'z').to_a + ('0'..'9').to_a
    code = (
          Array.new(8) do
            a[rand(a.size)]
          end
          ).join
  end
end
