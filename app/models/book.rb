class Book < ActiveRecord::Base
  attr_accessible :created_at, :detail_page_url, :isbn, :list_price, :medium_image, :number, :published_at, :manufacturer, :small_image, :status, :title, :updated_at, :author, :user_id

  belongs_to :user
end
