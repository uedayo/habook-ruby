module BooksHelper
  def booklend_path(isbn)
    url_for(:controller => 'books', :action => 'lend',:isbn => isbn)
  end

  def bookupdate_path(isbn, user_id)
    url_for(:controller => 'books', :action => 'lendupdate',:isbn => isbn, :user_id => user_id)
  end
end
