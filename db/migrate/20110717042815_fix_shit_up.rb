class FixShitUp < ActiveRecord::Migration
  def self.up
    remove_column :stories, :place_id
    remove_column :places, :story_id
  end

  def self.down
    add_column :places, :story_id, :integer
    add_column :stories, :place_id, :integer
  end
end
