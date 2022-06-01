class AddIsApprovedToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :is_approved, :bool, default: false
  end
end
