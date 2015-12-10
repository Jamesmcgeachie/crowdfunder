class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :user_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
