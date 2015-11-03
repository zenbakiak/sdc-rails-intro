class CreateGags < ActiveRecord::Migration
  def change
    create_table :gags do |t|
      t.string :title
      t.string :media_file
      t.integer :votes_count, default: 0
      t.integer :comments_count, default: 0
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
