class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validates
  validates :username, presence: true, uniqueness: true

  # Associations
  has_many :discussions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :discussion_subscriptions, dependent: :destroy
  has_many :notifications, as: :recipient
end
