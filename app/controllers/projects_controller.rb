class ProjectsController < ApplicationController

  before_action :get_project, only: [:show, :edit, :update]
  before_action :project_permission, only: [:edit, :update, :destroy]
  skip_before_action :require_login, only: [:show, :index]


  def index
  	@projects = Project.all
  end

  def show
    @total = @project.project_total
  end

  def new
  	@project = Project.new
    @reward = @project.rewards.build
  end

  def edit
  end

  def create
  	@project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private

  def get_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date, rewards_attributes: [:tier_value, :reward_name, :description, :id, :_destroy])
  end

  def project_permission
    get_project
    unless @project.user == current_user
      redirect_to project_path(@project)
      flash[:alert] = "You are not the project owner, so you cannot edit this project."
    end
  end
end
