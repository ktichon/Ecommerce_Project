class User < ApplicationRecord

  belongs_to :province
  validates :address, presence: true
  validates_zipcode :postal

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
