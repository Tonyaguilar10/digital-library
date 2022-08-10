class Book < ApplicationRecord
  has_many :reservations
  validates :stock, numericality: {greater_than_or_equal_to: 0}
  validates :published_year, numericality: {greater_than_or_equal_to: 868}
end
