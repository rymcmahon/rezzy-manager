class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :table, optional: true
end
