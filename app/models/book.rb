class Book < ActiveRecord::Base
  attr_accessible :created_at, :detail_page_url, :isbn, :list_price, :medium_image, :number, :published_at, :manufacturer, :small_image, :status, :title, :updated_at, :author, :user_id

  belongs_to :user

  def lend_status
    if user.nil?
      0
    else
      status
    end
  end

  def name
    if user.nil?
      ""
    else
      user.name
    end
  end

  def screen_name
    if user.nil?
      ""
    else
      user.screen_name
    end
  end

  def profile_image_url
    if user.nil?
      ""
    else
      user.profile_image_url
    end
  end

end
