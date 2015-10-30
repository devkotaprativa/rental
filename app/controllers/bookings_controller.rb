class BookingsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @booking = Booking.new
    @room = Room.find(params[:room_id])
    @user = User.find(params[:user_id])
  end

  def create
  end

  def index
  end

  def destroy
  end

  def show
  end
end
