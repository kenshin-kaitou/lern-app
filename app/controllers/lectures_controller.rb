class LecturesController < ApplicationController
	before_action :search_lectures
	before_action :set_category_column
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
		@like = Like.find_by(user_id: current_user.id, lecture_id: @lecture.id)
		@comment = Comment.new
		@comments = @lecture.comments.includes(:user).order("id DESC")
		gon.lecture = @lecture 
	end

	def edit
		@lecture = Lecture.find(params[:id])
	end

	def update
		@lecture = Lecture.find(params[:id])
		if @lecture.update(lectures_parameter)
			redirect_to lecture_path
		else
			render :edit
		end
	end

	def destroy
		@lecture = Lecture.find(params[:id])
		@lecture.destroy
		redirect_to root_path
	end

	def search
		@results = @p.result.includes(:category)
	end
	private

	def lectures_parameter
		params.require(:lecture).permit(:title,:overview,:video,:image,:category_id).merge(user_id: current_user.id)
	end

	def search_lectures
		@p = Lecture.ransack(params[:q])
	end

	def set_category_column
		@category_name = Category.select("name").distinct
	end

end
