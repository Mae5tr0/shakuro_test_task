class ShopsQuery
  # @TODO docs
  def self.all_shops_ordered_by_sold_count(publisher)
    query = <<~SQL
      SELECT sh.*,
       p.sold_count
      FROM shops sh
        INNER JOIN (
          SELECT DISTINCT s.shop_id
          FROM stocks s
            INNER JOIN books b ON b.id = s.book_id
          WHERE b.publisher_id = #{publisher.id}
            AND s.amount > 0
                   ) st ON st.shop_id = sh.id
        LEFT JOIN (
          SELECT p.shop_id,
                 count(*) AS sold_count
          FROM purchases p
            INNER JOIN books b ON b.id = p.book_id
          WHERE b.publisher_id = #{publisher.id}
          GROUP BY p.shop_id
                  ) p ON p.shop_id = sh.id
      ORDER BY p.sold_count
    SQL

    Shop.find_by_sql(query)
  end

  # def shops_ordered_by_sold_count_for_publisher(publisher)
  #
  #   relation.joins(shops_ids_with_sold_count_by_publisher.to_sql)
  # end
  #
  #
  # def shops_ids_with_sold_count_by_publisher(publisher)
  #   Purchase
  #       .select('purchases.shop_id, COUNT(*) as sold_count')
  #       .joins(:book)
  #       .where(books: {publisher: publisher.id})
  #       .group('purchases.shop_id')
  # end
  #
  # def shops_ids_with_books_by_publisher(publisher)
  #   relation
  #       .select('DISTINCT(shops.id)')
  #       .joins(:books)
  #       .where(books: {publisher: publisher.id})
  #       .where('stocks.amount > ?', 1)
  # end
end