class User < ApplicationRecord
  has_many :games
  has_many :posts # can you do 'has_many :games, :posts'?
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
