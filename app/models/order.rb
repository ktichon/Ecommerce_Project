class Order < ApplicationRecord
  belongs_to :customer
  has_many :book_in_orders
  has_many :books, through: :book_in_orders
  validates :GST, :PST, :HST, :total, presence: true,  numericality: { greater_than_or_equal_to: 0}
  validates :status, presence: true
end
