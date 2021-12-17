class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.references :user
      t.integer :reply_count, default: 0
      t.integer :in_reply_to_post_id
      t.integer :in_reply_to_author_id
      t.string :in_reply_to_author_name

      t.timestamps
    end
  end
end
