class AddUserIdIndexToFollowers < ActiveRecord::Migration[5.2]
  def change
   add_index :followers, :user_id, unique: true, where: 'user_id IS NOT NULL'
  end
end
