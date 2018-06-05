class Shop < ApplicationRecord
  has_many :stock
  has_many :books, through: :stock

  # rubocop:disable Rails/SkipsModelValidations
  def sold_out!(book_ids)
    stock.where(book_id: book_ids).where('amount > 0').update_all(amount: 0)
  end
  # rubocop:enable Rails/SkipsModelValidations
end
