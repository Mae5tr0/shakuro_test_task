class PublisherShopsSerializer < ActiveModel::Serializer
  has_many :shops do
    object.shops
  end

  class ShopSerializer < ActiveModel::Serializer
    attributes :id, :name

    attribute :books_sold_count do
      object.sold_count
    end

    attribute :books_in_stock do
      # merge logic
    end


    class BooksSerializer < ActiveModel::Serializer
      attributes :id, :title

      attribute :copies_in_stock do
        object.amount || 0
      end
    end
  end
end
