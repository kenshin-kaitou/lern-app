class Lecture < ApplicationRecord
	belongs_to :user
	has_one :image
	has_one :video
	belongs_to :category
end
