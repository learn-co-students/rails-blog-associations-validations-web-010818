class User < ActiveRecord::Base

  has_many :posts

  validates :name, uniqueness: true
  validates :name, presence: true
end
