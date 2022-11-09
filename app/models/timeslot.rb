class Timeslot < ApplicationRecord

  belongs_to :day

  def day_name
    self.day.name[-6..-1]
  end
  end
