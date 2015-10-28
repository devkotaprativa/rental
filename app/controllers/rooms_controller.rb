class RoomsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @rooms = Room.all
    @new_room = Room.new
    @user = current_user
  end

  def new
    @room = Room.new
    @user = User.find(params[:user_id])
  end

  def edit
    @user = User.find(params[:user_id])
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash.notice = "Successfully Deleted"
    redirect_to user_rooms_path(current_user.id)
  end

  def show
    @new_room = Room.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = params[:user_id]
    @room.save
    redirect_to user_rooms_path(current_user.id)
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    flash.notice = "Successfully #{@room.title} Updated !!"
    redirect_to user_rooms_path(current_user.id)
  end

  def room_params
    params.require(:room).permit(:title, :description, :price)
  end
end
