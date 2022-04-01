class BookGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre
  paginates_per 25
end
