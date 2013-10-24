# coding: utf-8

require 'amazon/aws'
require 'amazon/aws/search'
include Amazon::AWS

class BooksController < ApplicationController

  def index
    @books = Book.all(:order => "read_count DESC")
  end

  def show
    @book = Book.find_by_isbn(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      flash.keep[:notice] = $notice_add_success
      redirect_to books_path
    else
      render action: 'new'
    end
  end

  def register
    isbn = params[:isbn]
    @book = Book.find_by_isbn(isbn)
    if @book.nil?
      result = amazon(isbn)
      if result
        flash.keep[:notice] = $notice_add_success
        redirect_to books_path
      else
        render action: 'error'
      end
    else
      flash.keep[:notice] = $notice_already_exests
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find_by_isbn(params[:id])
  end

  def update
    @book = Book.find_by_isbn(params[:id])
    if @book.update_attributes(params[:book])
      flash.keep[:notice] = $notice_update_success
      redirect_to books_path
    else
      render action: 'edit'
    end
  end

  def lend
    isbn = params[:isbn]
    @book = Book.find_by_isbn(isbn)
    if @book.nil?
      amazon(isbn)
    end
    @users = User.all(:order => "updated_at DESC")
  end

  def lendupdate
    @book = Book.find_by_isbn(params[:isbn])
    user = User.find_by_screen_name(params[:screen_name])
    if @book.present? && user.present?
      @book.update_attributes(:user_id => user.id, :status => '1')
      user.update_attribute(:reading_count, user.reading_count + 1)
      flash.keep[:notice] = $notice_update_success
      redirect_to books_path
    else
      render action: 'index'
    end
  end

  def return
    @book = Book.find_by_isbn(params[:isbn])
    if @book.present?
      @book.update_attribute(:read_count, @book.read_count + 1)
      @book.user.update_attribute(:read_count, @book.user.read_count + 1)
      @book.user.update_attribute(:reading_count, @book.user.reading_count - 1)
      @book.update_attributes(:user_id => 0, :status => 0)
      flash.keep[:notice] = $notice_update_success
      redirect_to books_path
    else
      render action: 'index'
    end
  end

  def search
    if !params[:q].blank?
      search_word = URI.decode(params[:q].to_s)
      @books = Book.where(["title LIKE ?", "%#{search_word}%"]) if params[:q].present?
      flash[:notice] = @books.length.to_s + $notice_match
    else
      @books = Book.all(:order => "read_count DESC")
    end
    render action: 'index'
  end

  private
  def amazon(isbn)
    @book = Book.new

    begin
      itemLookup = ItemLookup.new('ISBN', ItemId: isbn, SearchIndex: 'Books')
      request  = Search::Request.new
      response = request.search itemLookup
      item = response.item_lookup_response.items.item
      @book.title = item.item_attributes.title.to_s
      @book.author = item.item_attributes.author.to_s
      @book.manufacturer = item.item_attributes.manufacturer.to_s
      @book.isbn = isbn.to_s
      @book.volume = 1
      @book.detail_page_url = item.detail_page_url.to_s
      @book.small_image = item.small_image.url.to_s
      @book.medium_image = item.medium_image.url.to_s
      @book.save
      true
    rescue
      false
    end
  end

end
