class AddPlaceIdToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :place_id, :integer
  end

  def self.down
    remove_column :stories, :place_id
  end
end
