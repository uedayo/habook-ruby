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

end
