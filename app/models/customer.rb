class Customer < ApplicationRecord
  belongs_to :province
  has_many :orders
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
