class BooksQuery
  attr_reader :relation

  def initialize(relation = Book.all)
    @relation = relation
  end

  def with_amount_for_publisher(publisher)
    relation.select('b.*, stocks.amount').joins(:stock).where(publisher: publisher.id)
  end
end