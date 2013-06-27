class User < ActiveRecord::Base
  attr_accessible :name, :profile_image_url, :screen_name

  validates :name, :presence => true,
                   :length => { :minimum => 1}
  validates :profile_image_url, :presence => true,
                                :length => { :minimum => 10}
  validates :screen_name, :presence => true,
                          :uniqueness => true,
                          :length => { :minimum => 3}

  def to_param
    screen_name.parameterize
  end
end
