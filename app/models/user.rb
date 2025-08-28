class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :reactions

  has_many :comments

  validates :username, presence: true, uniqueness: true
end
