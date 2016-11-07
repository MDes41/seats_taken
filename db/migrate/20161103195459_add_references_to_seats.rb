class AddReferencesToSeats < ActiveRecord::Migration[5.0]
  def change
    add_reference :seats, :trips, foreign_key: true
  end
end
