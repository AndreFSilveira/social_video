class AddReferencesToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :video, index:true, foreign_key: true, :null => true
    add_reference :comments, :news, index:true, foreign_key: true, :null => true
  end
end
