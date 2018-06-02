# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create(*attr)
  FactoryBot.create(*attr)
end

def create_list(*attr)
  FactoryBot.create_list(*attr)
end

# Populate DB with test data (for local development)
publisher_1 = create(:publisher)
book_1 = create(:book, publisher: publisher_1)
book_2 = create(:book, publisher: publisher_1)
book_3 = create(:book, publisher: publisher_1)
shop_1 = create(:shop)
shop_2 = create(:shop)
shop_3 = create(:shop)

create(:stock, shop: shop_1, book: book_1, amount: 7)
create(:stock, shop: shop_1, book: book_2, amount: 5)
create(:stock, shop: shop_1, book: book_3, amount: 11)

create(:stock, shop: shop_2, book: book_2, amount: 3)
create(:stock, shop: shop_2, book: book_3, amount: 19)

create(:stock, shop: shop_3, book: book_3, amount: 55)

create_list(:purchase, 7, book: book_2, shop: shop_2)
create_list(:purchase, 11, book: book_3, shop: shop_2)
create_list(:purchase, 2, book: book_3, shop: shop_3)

# random data
create_list(:stock, 10)
create_list(:book, 20)
create_list(:shop, 20)
create_list(:publisher, 20)