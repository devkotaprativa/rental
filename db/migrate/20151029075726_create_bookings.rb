class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :status
      t.string :message

      t.timestamps null: false
    end
  end
end
