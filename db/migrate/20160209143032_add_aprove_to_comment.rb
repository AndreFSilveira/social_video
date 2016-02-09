class AddAproveToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :aprove, :boolean, default: false
  end

  def self.down
    remove_column :comments, :aprove
  end
end
