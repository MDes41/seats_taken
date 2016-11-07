class Trip < ApplicationRecord
  belongs_to :meetup_times
  belongs_to :destinations
end
