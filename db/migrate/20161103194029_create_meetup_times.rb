class CreateMeetupTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :meetup_times do |t|
      t.string :hour
      t.string :minute
      t.string :suffix
    end
  end
end
