class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.integer :volume
      t.string :title
      t.string :author
      t.string :manufacturer
      t.string :small_image
      t.string :medium_image
      t.string :detail_page_url
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
    add_index :books, [:isbn, :volume], :unique => true
  end
end