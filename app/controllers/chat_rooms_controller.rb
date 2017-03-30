class ChatRoomsController < ApplicationController

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.initiated_chat_rooms.build(chat_room_params)
    # make this respond to js in future
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      flash[:errors] = @chat_room.errors.full_messages.to_sentence
      redirect_to chat_rooms_path
    end
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id])
    @chat_room.destroy
    redirect_to chat_rooms_path
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :recipient_id, :image)
  end
end
