class Lecture < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	has_one_attached :video
	belongs_to :category
	has_many :likes
	has_many :liked_users, through: :likes, source: :user
end
