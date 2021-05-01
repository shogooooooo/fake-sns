# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes, dependent: :destroy

  validates :content, presence: true
  validates :images, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def date
    t = Time.zone.now - self.created_at
    - if t < 60*60*24
      t2= t/(60*60)
      "#{t2.floor} hours ago"
    else
      self.display_created_at
    end
  end
end


#if within 24 hours ago
 #"~hours ago"
#else
  #year/date