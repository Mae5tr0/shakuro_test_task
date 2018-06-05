class BooksQuery
  attr_reader :relation

  def initialize(relation = Book.all)
    @relation = relation
  end

  def with_amount_for_publisher(publisher)
    relation
      .select('books.*, stocks.amount, stocks.shop_id')
      .joins(:stock)
      .where(publisher: publisher.id)
  end
end
