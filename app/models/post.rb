class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  def is_already_liked(user_id)
    return likes.find_by(user_id: user_id) != nil
  end
end
