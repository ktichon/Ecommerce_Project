class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :image
  has_many :book_genres, dependent: :delete_all
  has_many :genres, through: :book_genres
  validates :name, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0}
  paginates_per 50
end
