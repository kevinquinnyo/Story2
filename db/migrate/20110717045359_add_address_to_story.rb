class AddAddressToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :address, :string
  end

  def self.down
    remove_column :stories, :address
  end
end
