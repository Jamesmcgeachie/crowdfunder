class PledgesController < ApplicationController

  def create
    get_reward
    @pledge = @reward.pledges.build(pledge_params)
    @pledge.user = current_user


    respond_to do |format|
      if @pledge.save
        format.html {redirect_to project_path(@pledge.project), notice: "Successfully pledged! Thank you!"}
        format.js {}
      else
        format.html{ redirect_to project_path(@pledge.project), alert: "Sorry, that pledge didn't go through"}
        format.js {}
      end
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
