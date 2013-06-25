require 'amazon/aws'
require 'amazon/aws/search'
include Amazon::AWS

class BooksController < ApplicationController

  def index
    @books = Book.all(:order => "updated_at DESC")

    @books.each do |book|
      if book.user_id != 0
        user = User.find(book.user_id)
        book.screen_name = user.screen_name
        book.name = user.name
        book.profile_image_url = user.profile_image_url
      end
    end

    p @books
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:post])
    if @book.save
      redirect_to books_path
    else
      render action: 'new'
    end
  end

  def lend
    isbn = params[:isbn]
    @book = Book.where("isbn = ?", isbn).first
    if @book.nil?
      amazon(isbn)
    end
    @users = User.all(:order => "updated_at DESC")
  end

  def lendupdate
    @book = Book.where('isbn = ?', params[:isbn]).first
    if @book.update_attributes(:user_id => params[:user_id], :status => '1')
      redirect_to books_path, notice: 'updated!'
    else
      render action: 'index'
    end
  end

  def return
    @book = Book.where('isbn = ?', params[:isbn]).first
    if @book.update_attributes(:user_id => '0', :status => '0')
      redirect_to books_path, notice: 'updated!'
    else
      render action: 'index'
    end
  end

  private
  def amazon(isbn)
    @book = Book.new

    itemLookup = ItemLookup.new('ISBN', ItemId: isbn, SearchIndex: 'Books')
    request  = Search::Request.new
    response = request.search itemLookup
    
    item = response.item_lookup_response.items.item
    @book.title = item.item_attributes.title.to_s
    @book.author = item.item_attributes.author.to_s
    @book.manufacturer = item.item_attributes.manufacturer.to_s
    @book.isbn = isbn.to_s
    @book.detail_page_url = item.detail_page_url.to_s
    @book.small_image = item.small_image.url.to_s
    @book.medium_image = item.medium_image.url.to_s
    @book.save
  end

end
