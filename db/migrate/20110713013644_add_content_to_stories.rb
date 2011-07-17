class AddContentToStories < ActiveRecord::Migration
  def self.up
    change_column :stories, :content, :text
  end

  def self.down
    drop_column :stories, :content, :text
  end
end
