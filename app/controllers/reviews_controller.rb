class ReviewsController < ApplicationController
  before_action :get_project

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @project.reviews.build(review_params)
  	@review.user = current_user
  	
    respond_to do |format|
      if @review.save
        format.html { redirect_to project_path(@project), notice: 'Review added.'}
        format.js {}
      else
        format.html { render 'projects/show', alert: 'There was an error.'}
        format.js {}
      end
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
