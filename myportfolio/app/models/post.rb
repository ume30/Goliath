class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 5}}
  validates :user_id, {presence: true}
  validates :group_id, {presence: true}
  belongs_to :user
  belongs_to :group

  def user
    return User.find_by(id:self.user_id)
  end

  def group
    return Group.find_by(id:self.group_id)
  end
end
