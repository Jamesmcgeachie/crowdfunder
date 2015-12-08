class AddStartEndDateProject < ActiveRecord::Migration
  def change
  	add_column :projects, :start_date, :datetime
  	add_column :projects, :end_date, :datetime

  	add_column :projects, :photo_url, :string
  end
end
