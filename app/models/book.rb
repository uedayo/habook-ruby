class Book < ActiveRecord::Base
  attr_accessible :createdAt, :detailPageUrl, :isbn, :listPrice, :mediumImage, :number, :publishedAt, :publisher, :smallImage, :status, :title, :updatedAt
end
