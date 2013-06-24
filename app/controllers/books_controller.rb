require 'amazon/aws'
require 'amazon/aws/search'
include Amazon::AWS

class BooksController < ApplicationController

  def index
    @books = Book.all(:order => "updatedAt DESC")
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
  end

  def return
  end

  def amazon
#    @isbn = params[:isbn]
    @isbn = '9784797372274'
    il = ItemLookup.new('ISBN', ItemId: @isbn, SearchIndex: 'Books')
    request  = Search::Request.new
    response = request.search il
    
    item = response.item_lookup_response.items.item
    p item.item_attributes.title
    p item.item_attributes.author
    p item.item_attributes.manufacturer
    p item.detail_page_url
    p item.small_image.url

  end

end
