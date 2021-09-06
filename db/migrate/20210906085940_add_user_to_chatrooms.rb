class AddUserToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :owner, null: false, foreign_key: { to_table: :users }
    add_reference :chatrooms, :invitee, null: false, foreign_key: { to_table: :users }
  end
end
