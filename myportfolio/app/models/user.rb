class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  has_many :posts
  has_many :group_users
  has_many :groups, through: :group_users

  def posts
    return Post.where(user_id:self.id)
  end
end
