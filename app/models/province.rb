class Province < ApplicationRecord
  has_many :customers, dependent: :delete_all
  validates :abbrev, :name, presence: true
  validates :PST, :HST, presence: true,  numericality: { greater_than_or_equal_to: 0}
end
