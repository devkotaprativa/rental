class AddRoomToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :room, :integer
  end
end
