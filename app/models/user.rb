# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :follows, dependent: :destroy
  has_many :followings, through: :follows, source: :followee
  has_many :followers, through: :follows, source: :follower
end
