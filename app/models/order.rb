class Order < ApplicationRecord
  belongs_to :customer
  has_many :book_in_orders
  has_many :books, through: :book_in_orders
  accepts_nested_attributes_for :book_in_orders, allow_destroy: true

  validates :GST, :PST, :HST, :total, presence: true,  numericality: { greater_than_or_equal_to: 0}
  validates :status, presence: true
end
