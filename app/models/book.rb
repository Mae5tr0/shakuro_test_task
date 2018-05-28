class Book < ApplicationRecord
  belongs_to :publisher
  has_many :shops, through: :stock
  has_many :stock
end
