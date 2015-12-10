class AddTotalRaisedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :total_raised, :integer
  end
end
