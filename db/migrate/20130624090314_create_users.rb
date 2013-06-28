class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :screen_name, :null => false
      t.string :profile_image_url, :null => false
      t.integer :read_count, :null => false, :default => 0
      t.integer :reading_count, :null => false, :default => 0

      t.timestamps
    end
    add_index :users, :screen_name, :unique => true
  end
end
