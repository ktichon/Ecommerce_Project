class InfoPage < ApplicationRecord
  validates :title, :content, :permalink, presence: true
  validates :permalink, uniqueness: true
end
