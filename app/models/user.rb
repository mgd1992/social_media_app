class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]


  has_many :posts

  validates :username, presence: true, uniqueness: true
end
