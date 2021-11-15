class BookInOrder < ApplicationRecord
  belongs_to :book
  belongs_to :order
  validates :amount, presence: true,  numericality: { only_integer: true }
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0}
end
