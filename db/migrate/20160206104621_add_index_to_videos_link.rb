class AddIndexToVideosLink < ActiveRecord::Migration
  def change
  	add_index :videos, :link, unique: true
  end
end
