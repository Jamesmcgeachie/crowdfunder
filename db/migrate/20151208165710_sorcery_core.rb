class SorceryCore < ActiveRecord::Migration
  def change
  	rename_column :users, :password_digest, :crypted_password
  	add_column :users, :salt, :string
  	add_index :users, :email, unique: true
  end
end