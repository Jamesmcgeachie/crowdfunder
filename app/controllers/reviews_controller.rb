class ReviewsController < ApplicationController
  before_action :get_project

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @project.reviews.build(review_params)
  	@review.user = current_user
  	if @review.save
  		redirect_to projects_path, notice: 'Review created successfully'
  	else
  		render 'project/show'
  	end 
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :project_id)
  end

  def get_project
  	@project = Project.find(params[:project_id])
  end
end
