# Shakuro test exam on backend developer position 

## Requirements.
- Publishers produce books that are sold in shops.
- A book can be distributed via multiple shops.
- A shop can sell multiple copies of a book.

## What should to be done

Please model the required database relations and create API Endpoints described below.
The code should be covered with tests (rspec).

### Endpoint 1

For a specific Publisher it should return the list of shops selling at least one book of that publisher. 
Shops should be ordered by the number of books sold. Each shop should include the list of Publisher’s books that are 
currently in stock. 

Example response:
```json
{
  "shops": [
    {
      "id": 1,
      "name": "Amazon",
      "books_sold_count": 10,
      "books_in_stock": [
        {
          "id": 2,
          "title": "Yiddish songs",
          "copies_in_stock": 3
        }
      ]
    }
  ]
}
```

### Endpoint 2

 For a specific Shop it should mark one or multiple copies of a book as sold.
 

# Requirements

# How to run

* For local development you can populate db with random data:
rails db:seed

# Implementation notes

We have two main strategies here - load more data from DB and process it in ruby or create more complicated SQL for
receiving only what we want. I choose second way with more complicated queries. Advantages: more effective way 
for loading and processing data, disadvantages - complicated SQL and more difficult to support.  



## TODO
 
* Readme
    ** about seed, how to run, requirements, how to set up     
* Docs
* Seeds
* DB schema
* Implementation notes
    * about optimizations
* Tests
* Rubocop
* Final review 

