class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id, foreign_key: true
      t.references :chat_room, foreign_key: true

      t.timestamps
    end
  end
end
