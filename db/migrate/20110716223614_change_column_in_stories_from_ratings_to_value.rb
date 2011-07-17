class ChangeColumnInStoriesFromRatingsToValue < ActiveRecord::Migration
  def self.up
    rename_column :stories, :rating, :value
  end

  def self.down
  end
end
