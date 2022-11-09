class Day < ApplicationRecord
   belongs_to :week

  has_many  :timeslots


end
