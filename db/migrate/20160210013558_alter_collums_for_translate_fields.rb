class AlterCollumsForTranslateFields < ActiveRecord::Migration
  def up
    #comment
    rename_column :comments, :content, 'content_pt_br'
    add_column :comments, :content_es, :string

    #videos
    rename_column :videos, :title, 'title_pt_br'
    add_column :videos, :title_es, :string

    #news
    rename_column :news, :title , 'title_pt_br'
    add_column :news, :title_es, :string
    rename_column :news, :content , 'content_pt_br'
    add_column :news, :content_es, :string

    #tags
    rename_column :tags, :name, 'name_pt_br'
    add_column :tags, :name_es,  :string

  end

  def down
    #comments
    rename_column :comments, 'content_pt_br', :content
    remove_column :comments, :content_es

    #videos
    rename_column :videos, 'title_pt_br', :title
    remove_column :videos, :title_es

    #news
    rename_column :news, 'title_pt_br', :title
    remove_column :news, :title_es
    rename_column :news, 'content_pt_br', :content
    remove_column :news, :content_es

    #tags
    rename_column :tags, 'name_pt_br', :name
    remove_column :tags, :name_es

  end
end
