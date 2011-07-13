class RemoveContentFromStories < ActiveRecord::Migration
  def self.up
    remove_column :stories, :content
  end

  def self.down
    add_column :stories, :content
  end
end
