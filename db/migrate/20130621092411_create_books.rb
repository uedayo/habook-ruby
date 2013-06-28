class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn, :null => false
      t.integer :volume, :null => false, :default => 1
      t.string :title, :null => false
      t.string :author, :null => false
      t.string :manufacturer, :null => false, :default => "unknown"
      t.string :small_image, :null => false, :default => "unknown"
      t.string :medium_image, :null => false, :default => "unknown"
      t.string :detail_page_url, :null => false, :default => "unknown"
      t.integer :read_count, :null => false, :default => 0
      t.integer :status, :null => false, :default => 0
      t.integer :user_id, :null => false, :default => 0

      t.timestamps
    end
    add_index :books, [:isbn, :volume], :unique => true
  end
end