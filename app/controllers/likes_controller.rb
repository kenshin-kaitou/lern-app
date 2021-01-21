class LikesController < ApplicationController
	before_action :set_lecture
	def create
		@like = Like.create(user_id: current_user.id,lecture_id: @lecture.id)
	end

	def destroy
		@like = current_user.likes.find_by(lecture_id: @lecture.id)
		@like.destroy
	end

	private
  	def set_lecture
    	@lecture = Lecture.find(params[:lecture_id])
  	end
end
