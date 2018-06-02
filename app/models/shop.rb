class Shop < ApplicationRecord
  has_many :stock
  has_many :books, through: :stock
end
