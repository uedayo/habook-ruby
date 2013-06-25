module BooksHelper
  def bookupdate_path(isbn, user_id)
    url_for(:controller => 'books', :action => 'lendupdate',:isbn => isbn, :user_id => user_id)
  end
end
