# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_and_belongs_to_many :categories

  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
  validates :title, presence: true, length: { maximum: 50 }

  def self.search(search)
    if search
      where(['content LIKE ?', "%#{ search }%"])
    else
      all
    end
  end
end
