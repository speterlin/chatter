class AddInitiatorAndRecipientToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :initiator_id, :integer
    add_column :chat_rooms, :recipient_id, :integer
    remove_column :chat_rooms, :user_id
    add_index :chat_rooms, [:initiator_id, :recipient_id], unique: true
  end
end
