class LecturesController < ApplicationController
	def index
		@lectures = Lecture.all
	end

	def new
		@lecture = Lecture.new

	end

	def create
		@lecture = Lecture.new(lectures_parameter)
		if @lecture.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@lecture = Lecture.find(params[:id])
	end


	private

	def lectures_parameter
		params.require(:lecture).permit(:title,:overview,:video,:image).merge(user_id: current_user.id)
	end
end
