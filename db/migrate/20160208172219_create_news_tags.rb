class CreateNewsTags < ActiveRecord::Migration
  def change
    create_table :news_tags do |t|
      t.references :news, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
