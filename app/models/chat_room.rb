# == Schema Information
#
# Table name: chat_rooms
#
#  id           :integer          not null, primary key
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  initiator_id :integer          not null
#  recipient_id :integer          not null
#  description  :text
#  image        :string
#

class ChatRoom < ApplicationRecord
  validates_presence_of :initiator, :recipient
  validates_uniqueness_of :initiator_id, scope: [:recipient_id]
  belongs_to :initiator, class_name: 'User', foreign_key: :initiator_id
  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id
  has_many :messages, dependent: :destroy
  mount_uploader :image, ImageUploader

end
