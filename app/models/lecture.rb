class Lecture < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	has_one_attached :video
	belongs_to :category
end
