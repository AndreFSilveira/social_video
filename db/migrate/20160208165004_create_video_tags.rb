class CreateVideoTags < ActiveRecord::Migration
  def change
    create_table :video_tags do |t|
      t.references :video, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
