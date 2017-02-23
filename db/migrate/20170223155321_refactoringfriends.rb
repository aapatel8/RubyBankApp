class Refactoringfriends < ActiveRecord::Migration[5.0]
  def change
      drop_table :friends

      create_table "friendships" do |t|
          t.integer :user_id
          t.integer :friend_id
      end
  end
end
