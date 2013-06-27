class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :screen_name
      t.string :profile_image_url

      t.timestamps
    end
    add_index :users, :screen_name, :unique => true
  end
end
