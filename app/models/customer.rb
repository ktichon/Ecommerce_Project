class Customer < ApplicationRecord
  belongs_to :province
  has_many :orders
  validates :address, presence: true
  validates_zipcode :postal_code

end
