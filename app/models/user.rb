class User < ApplicationRecord
  has_many :reservations 
  has_many :tables, through: :reservations
  accepts_nested_attributes_for :reservations, allow_destroy: true
  accepts_nested_attributes_for :tables, allow_destroy: true

  after_save :update_ends_at

  private
    def update_ends_at
      self.reservations.update(ends_at: self.reservations.last.starts_at.advance(hours: 1))
    end
end
