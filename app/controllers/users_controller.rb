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

end
