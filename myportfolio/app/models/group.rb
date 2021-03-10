class Group < ApplicationRecord
  has_many :posts
  has_many :group_users
  has_many :users, through: :group_users
  validates :name, {presence: true, uniqueness: true, length: {maximum: 15}}
  validates :code, {presence: true, length: {maximum: 5}}

  def posts
    return Post.where(group_id: self.id)
  end

end
