class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :table, optional: true

  def self.just_date(date)
    date.to_date
  end
end
