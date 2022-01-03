class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :content, :in_reply_to_post_id, :in_reply_to_author_id, :reply_count, :in_reply_to_author_name

  belongs_to :author
end