class AddDesriptionAndImageToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :description, :text
    add_column :chat_rooms, :image, :string
  end
end
