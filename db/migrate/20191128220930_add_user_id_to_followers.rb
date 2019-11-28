class AddUserIdToFollowers < ActiveRecord::Migration[5.2]
  def change
    add_column :followers, :user_id, :string, null: false
  end
  #add_index :followers, :user_id, unique: true
end
