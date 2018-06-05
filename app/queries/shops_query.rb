class ShopsQuery
  # Receive all shops which selling at least one book for specific publisher.
  # Shops ordered by the number of books sold.
  #
  # @param publisher [Publisher] the publisher model
  # @return [Shop] array with shops, every shop contained additional field `sold_count`
  #
  # @example
  #  ShopsQuery.all_shops_ordered_by_sold_count(Publisher.first) #=> [shop1, shop2]
  #
  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/MethodLength
end
