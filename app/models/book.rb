class Book < ApplicationRecord
  belongs_to :author
  has_many :book_genres
  has_many :genres, through: :book_genres
  validates :name, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0}
  paginates_per 50
end
