class AddDefaultValueToValue < ActiveRecord::Migration
  def self.up
    change_column_default :stories, :value, 0
  end

  def self.down
    # fixin' it
  end
end
