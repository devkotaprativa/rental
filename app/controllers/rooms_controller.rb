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
    respond_to do |format|
      format.js
    end
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
    @user = current_user
    @new_room = Room.new(room_params)
    @new_room.user_id = params[:user_id]
    if @new_room.save
      flash[:msg] = "Successfully created"
      redirect_to user_rooms_path(current_user.id)
    else
      flash[:msg] = "cannot create"
      render  partial: 'form'
    end

  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    flash[:msg]= "Successfully #{@room.title} Updated !!"
    redirect_to user_rooms_path(current_user.id)
  end

  def room_params
    params.require(:room).permit(:title, :description, :price, :image)
  end
end
