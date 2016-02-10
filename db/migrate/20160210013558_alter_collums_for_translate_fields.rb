class AlterCollumsForTranslateFields < ActiveRecord::Migration
  def up
    rename_column :comments, :content, 'content_pt-BR'
    add_column :comments, :content_es, :string
  end

  def down
    rename_column :comments, 'content_pt-BR', :content
    remove_column :comments, :content_es
  end
end
