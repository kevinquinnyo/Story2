class AddContentToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :content, :varchar, :limit => 10000
  end

  def self.down
    remove_column :stories, :content, :limit => 10000
  end
end
