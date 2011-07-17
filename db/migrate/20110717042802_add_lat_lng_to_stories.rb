class AddLatLngToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :lat, :float
    add_column :stories, :lng, :float
  end

  def self.down
    remove_column :stories, :lng
    remove_column :stories, :lat
  end
end