# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  image      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_photos_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
class Photo < ApplicationRecord
  belongs_to :post

  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
