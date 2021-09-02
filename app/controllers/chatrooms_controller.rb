class ChatroomsController < ApplicationController
  def index
    @messages = Message.where(user: current_user)
    @chatrooms = @messages.uniq(&:chatroom).map(&:chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end
end
