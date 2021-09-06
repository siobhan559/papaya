class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all.select { |chatroom| chatroom.exist_with?(current_user, current_user) }
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.create(invitee: User.find(params[:invitee]), owner: current_user)
    redirect_to chatroom_path(@chatroom)
  end
end
