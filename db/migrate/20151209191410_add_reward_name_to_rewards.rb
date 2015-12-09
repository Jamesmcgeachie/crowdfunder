class AddRewardNameToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :reward_name, :string
  end
end
