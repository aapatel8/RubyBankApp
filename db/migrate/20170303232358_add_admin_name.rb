class AddAdminName < ActiveRecord::Migration[5.0]
  def change
    change_table :admins do |t|
      t.string :name
    end
  end
end
