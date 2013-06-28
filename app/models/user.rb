class User < ActiveRecord::Base
  attr_accessible :name, :profile_image_url, :screen_name, :read_count

  validates :name, :presence => true,
                   :length => { :minimum => 1}
  validates :profile_image_url, :presence => true,
                                :length => { :minimum => 10}
  validates :screen_name, :presence => true,
                          :uniqueness => true,
                          :length => { :minimum => 3}
  validates :read_count, :presence => true

  def to_param
    screen_name.parameterize
  end
end
