class Customer < ApplicationRecord
  belongs_to :provence
  has_many :orders
  validates :address, presence: true
  validates :postal_code, zipcode: { country_code_attribute: :postal_code }

end
