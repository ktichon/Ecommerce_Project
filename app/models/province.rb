class Province < ApplicationRecord
  has_many :customers
  validates :abbrev, :name, presence: true
  validates :PST, :HST, presence: true,  numericality: { greater_than_or_equal_to: 0}
end
