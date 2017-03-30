class AddNullFalseToInitiatorAndRecipientToChatRooms < ActiveRecord::Migration[5.0]
  def change
    change_column :chat_rooms, :initiator_id, :integer, null: false
    change_column :chat_rooms, :recipient_id, :integer, null: false
  end
end
