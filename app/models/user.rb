# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_follows, foreign_key: :follower_id, class_name: 'Follow', inverse_of: :followee, dependent: :destroy
  has_many :passive_follows, foreign_key: :followee_id, class_name: 'Follow', inverse_of: :follower, dependent: :destroy
  has_many :followings, through: :active_follows, source: :followee
  has_many :followers, through: :passive_follows, source: :follower

  def following?(user)
    followings.include?(user)
  end
end
