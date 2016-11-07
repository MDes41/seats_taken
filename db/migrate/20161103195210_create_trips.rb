class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.references :meetup_times, foreign_key: true
      t.references :pickup, references: :destinations
      t.references :dropoff, references: :destinations
      t.timestamps
    end

    add_foreign_key :trips, :destinations, column: :pickup_id
    add_foreign_key :trips, :destinations, column: :dropoff_id

  end
end
