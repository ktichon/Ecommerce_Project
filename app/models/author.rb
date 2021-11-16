class Author < ApplicationRecord
  has_many :books, dependent: :delete_all
  validates :name, presence: true, length: { minimum: 2 }
  validates :info, allow_nil: true, length: { maximum: 2000,
    too_long: "%{count} characters is the maximum allowed" }
    paginates_per 25
end
