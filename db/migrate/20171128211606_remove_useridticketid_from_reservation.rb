class RemoveUseridticketidFromReservation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reservations, :user_id, foreign_key: true
    remove_reference :reservations, :ticket_id, foreign_key: true
  end
end
