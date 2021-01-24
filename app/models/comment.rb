class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :lecture
	validates :text , presence: true
end
