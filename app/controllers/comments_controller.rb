class CommentsController < ApplicationController
	def create
		@comment = current_user.comments.create(comment_params)
		render json:{ post: @comment }
	end

	private
	def comment_params
		params.require(:comment).permit(:text).merge(user_id: current_user.id, lecture_id: params[:lecture_id])
	end
end