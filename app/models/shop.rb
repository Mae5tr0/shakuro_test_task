class Shop < ApplicationRecord
  has_many :books, through: :stock
  has_many :stock
end
