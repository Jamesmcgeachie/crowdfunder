class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :tier_value
      t.text :description
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
