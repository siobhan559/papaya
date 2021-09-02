class ChatroomsController < ApplicationController
  def index
    # @chatrooms = Message.where()
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
  end
end
