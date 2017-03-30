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

require 'test_helper'

class ChatRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
