class PledgesController < ApplicationController
  def new
  end

  def create
    get_reward
    @pledge = @reward.pledges.build(pledge_params)
    @pledge.user = current_user
    if @pledge.save
      redirect_to project_path(@pledge.project)
    else
      render project_path(@pledge.project)
    end
  end

  def index
  end

  def show

  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

  def get_reward
    @reward = Reward.find(params[:reward_id])
  end

end
