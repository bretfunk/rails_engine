### README
Welcome to Rails Engine, a revolutionary new way to send APIs.
Below you will find information about our program:

* This Project Uses
-The Ruby version is 2.4.1
-Rails 5.1.2
-PostgreSQL

* System dependencies
Rails Engine uses serializer for API output and FactoryGirl for testing.

* Configuration
- In your terminal make a directory to hold this project (including the sample data).
- Clone this repo and the sample data into that directory
- git clone git@github.com:turingschool-examples/sales_engine.git
- git clone git@github.com:bretfunk/rails_engine.git
- `cd ralesengine`
- Run `bundle`

* Database creation
- To create the database, go to your terminal and run rake db:create
- Then run rake db:migrate to run the migration.
- Then, rake import to import the files.


* How to run the test suite
- The test suite uses RSpec. Enter `rspec` on the command line to run the test suite

* Running your server locally, `rails s`, you can interact with the following


#### Record Endpoints
* merchants
    `/api/v1/merchants/`
    `/api/v1/merchants/1`

  * customers
    `/api/v1/customers/`
    `/api/v1/customers/1`

  * Items
    `/api/v1/items/`
    `/api/v1/items/1`

  * invoices
    `/api/v1/invoices/`
    `/api/v1/invoices/1`

  * invoice_items
    `/api/v1/invoice_items/`
    `/api/v1/invoice_items/1`

  * transactions
    `/api/v1/transactions/`
    `/api/v1/transactions/1`

You can also query the above tables through search parameters such as
  `/api/v1/merchants/find?name=Schroeder-Jerde`
  `/api/v1/merchants/find_all?name=Cummings-Thiel`
  `/api/v1/items/random`

#### Relationship Endpoints

#### Merchants

 * `/api/v1/merchants/:id/items returns a collection of items associated with that merchant`
 * `/api/v1/merchants/:id/invoices returns a collection of invoices associated with that merchant from their known orders
Invoices`

 * `/api/v1/invoices/:id/transactions returns a collection of associated transactions`
 * `/api/v1/invoices/:id/invoice_items returns a collection of associated invoice items`
 * `/api/v1/invoices/:id/items returns a collection of associated items`
 * `/api/v1/invoices/:id/customer returns the associated customer`
 * `/api/v1/invoices/:id/merchant returns the associated merchant`

#### Invoice Items

 * `/api/v1/invoice_items/:id/invoice returns the associated invoice`
 * `/api/v1/invoice_items/:id/item returns the associated item`

#### Items

 * `/api/v1/items/:id/invoice_items returns a collection of associated invoice items`
 * `/api/v1/items/:id/merchant returns the associated merchant`

#### Transactions

 * `/api/v1/transactions/:id/invoice returns the associated invoice`

#### Customers

 * `/api/v1/customers/:id/invoices returns a collection of associated invoices`
 * `/api/v1/customers/:id/transactions`


#### Business Intelligence Endpoints

  * `/api/v1/merchants/:id/revenue`
  * `/api/v1/merchants/:id/revenue?date=x`
  * `/api/v1/merchants/most_items?quantity=x`
  * `/api/v1/customers/:id/favorite_merchant`
  * `/api/v1/items/:id/best_day`
  * `/api/v1/items/most_items?quantity=x`

  * `/api/v1/merchants/:id/customers_with_pending_invoices`
  * `/api/v1/merchants/:id/favorite_customer`
  * `/api/v1/items/most_revenue?quantity=x`
  * `/api/v1/merchants/revenue?date=x`
  * `/api/v1/merchants/most_revenue?quantity=x`
