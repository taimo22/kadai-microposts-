class Micropost < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: {maximum: 255}

  has_many :relation_favors
  has_many :like_users, through: :relation_favors, source: :user

  def like(user)
    relation_favors.find_or_create_by(user_id: user.id)
  end
  def remove_like(user)
    relation_favor = relation_favors.find_by(user_id: user.id)
    relation_favor.destroy if relation_favor
  end

  def like?(user)
    like_users.include?(user)
  end

end
