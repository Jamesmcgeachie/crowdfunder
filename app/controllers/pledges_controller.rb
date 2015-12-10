class PledgesController < ApplicationController

  def create
    get_reward
    @pledge = @reward.pledges.build(pledge_params)
    @pledge.user = current_user
    if @pledge.save
      flash[:notice] = "Successfully pledged! Thank you!"
      @pledge.add_to_total
      redirect_to project_path(@pledge.project)
    else
      flash[:alert] = "Sorry, that pledge didn't go through"
      redirect_to project_path(@pledge.project)
    end
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
