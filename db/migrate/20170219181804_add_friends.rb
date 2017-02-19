class AddFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|

      t.timestamps

      t.integer "friend_of"
      t.integer "friend_id"

    end
  end
end
