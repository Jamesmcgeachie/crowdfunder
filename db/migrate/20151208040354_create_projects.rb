class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :funding_goal
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
