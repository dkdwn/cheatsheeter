class AddUserToCheats < ActiveRecord::Migration[8.1]
  def change
    add_reference :cheats, :user, null: true, foreign_key: true
  end
end
