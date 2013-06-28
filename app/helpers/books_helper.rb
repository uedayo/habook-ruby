module BooksHelper
  def booklend_path(isbn)
    url_for(:controller => 'books', :action => 'lend',:isbn => isbn)
  end

  def bookupdate_path(isbn, screen_name)
    url_for(:controller => 'books', :action => 'lendupdate',:isbn => isbn, :screen_name => screen_name)
  end

  def booksearch_path
    url_for(:controller => 'books', :action => 'search')
  end
end
