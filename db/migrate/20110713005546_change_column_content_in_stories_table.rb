class ChangeColumnContentInStoriesTable < ActiveRecord::Migration
  def self.up
    change_column :stories, :content, :text
  end

  def self.down
  end
end
