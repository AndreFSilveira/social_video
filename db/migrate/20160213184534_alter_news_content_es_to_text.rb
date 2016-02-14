class AlterNewsContentEsToText < ActiveRecord::Migration
  def up
    change_column :news, :content_es, :text
    change_column :comments, :content_es, :text
  end

  def down
    change_column :news, :content_es, :string
    change_column :comments, :content_es, :string
  end
end
