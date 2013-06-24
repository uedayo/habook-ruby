class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :manufacturer
      t.string :small_image
      t.string :medium_image
      t.integer :list_price
      t.string :isbn
      t.string :detail_page_url
      t.integer :number
      t.integer :status
      t.datetime :published_at
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
