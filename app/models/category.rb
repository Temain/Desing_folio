# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  icon       :string(255)
#

class Category < ActiveRecord::Base
  has_and_belongs_to_many :microposts

  validates :name, presence: true, length: { maximum: 16 }
end
