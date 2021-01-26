class Lecture < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	has_one_attached :video
	belongs_to :category
	has_many :likes
	has_many :liked_users, through: :likes, source: :user
	has_many :comments
	with_options presence: true do
		validates :title
		validates :overview
		validates :image
		validates :video
	end
end