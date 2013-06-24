require 'amazon/aws'
require 'amazon/aws/search'
include Amazon::AWS

class BooksController < ApplicationController

  def index
    @books = Book.all(:order => "updated_at DESC")
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
    @book = Book.where("isbn = ?", params[:isbn]).first
    if @book.nil?
      amazon(isbn)
    end
  end

  def return
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
