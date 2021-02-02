# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy


  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :photos

  def liked_by(current_user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
