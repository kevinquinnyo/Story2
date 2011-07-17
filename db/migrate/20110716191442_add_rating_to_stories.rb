class AddRatingToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :rating, :integer
  end

  def self.down
    remove_column :stories, :rating
  end
end
