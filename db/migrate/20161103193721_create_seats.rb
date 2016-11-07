class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.integer :role
      t.references :driver, references: :users
      t.references :passenger, references: :users

      t.timestamps
    end

    add_foreign_key :seats, :users, column: :driver_id
    add_foreign_key :seats, :users, column: :passenger_id
  end
end
