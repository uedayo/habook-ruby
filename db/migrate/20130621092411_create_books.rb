class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.string :smallImage
      t.string :mediumImage
      t.integer :listPrice
      t.string :isbn
      t.string :detailPageUrl
      t.integer :number
      t.integer :status
      t.datetime :publishedAt
      t.datetime :createdAt
      t.datetime :updatedAt

      t.timestamps
    end
  end
end
