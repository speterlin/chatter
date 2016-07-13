# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  body         :text
#  sender_id    :integer
#  chat_room_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :chat_room
  validates :body, presence: true, length: {minimum: 2, maximum: 255}

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
