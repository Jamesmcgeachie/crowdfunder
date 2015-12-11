class RemoveTotalRaisedFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :total_raised, :integer
  end
end
