class AddStoryIdToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :story_id, :integer
  end

  def self.down
    remove_column :places, :story_id
  end
end
