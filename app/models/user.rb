class User < ApplicationRecord
  has_many :reservations
  has_many :tables, through: :reservations
  accepts_nested_attributes_for :reservations, allow_destroy: true
  accepts_nested_attributes_for :tables, allow_destroy: true
end
