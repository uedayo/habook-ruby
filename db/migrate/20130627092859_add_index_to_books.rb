class AddIndexToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :volume, :integer 
    add_index :books, [:isbn, :volume], :unique => true
  end

  def self.down
  end
end