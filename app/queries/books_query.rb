class BooksQuery
  attr_reader :relation

  def initialize(relation = Book.all)
    @relation = relation
  end

  # Receive books grouped by shop_id with amount in stock for shop
  #
  # @param publisher [Publisher] the publisher model
  # @return [Relation] active record relation with books
  #
  # @example
  #  BooksQuery.new.with_amount_for_publisher(Publisher.first) #=> [book1(shop1, amount1), book1(shop2, amount2)]
  #
  def with_amount_for_publisher(publisher)
    relation
      .select('books.*, stocks.amount, stocks.shop_id')
      .joins(:stock)
      .where(publisher: publisher.id)
  end
end
