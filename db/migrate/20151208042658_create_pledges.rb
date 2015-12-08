class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :reward, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
