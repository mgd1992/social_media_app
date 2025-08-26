class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions
  has_rich_text :body
  has_many_attached :images

  def feed_limit_body
    char_limit = images.any? ? 100 : 400
    body&.body&.to_plain_text&.first(char_limit)
  end

  def feed_body_dots?
    body_chars = body&.body&.to_plain_text&.chars&.count || 0
    feed_body_count = feed_limit_body&.chars&.count || 0
    body_chars > feed_body_count
  end

  def heart_reactions
    reactions.where(name: "heart")
  end

  def like_reactions
    reactions.where(name: "like")
  end

  def dislike_reactions
    reactions.where(name: "dislike")
  end

  def star_reactions
    reactions.where(name: "star")
  end
end
