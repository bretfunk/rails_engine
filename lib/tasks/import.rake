require 'csv'

desc "Import rows from csv file"
task :import => [:environment] do
  Customer.delete_all
  customer_file = "lib/data/customers.csv"

  CSV.foreach(customer_file, :headers => true) do |row|
    Customer.create!({
      :first_name => row[1],
      :last_name => row[2],
      :created_at => row[3],
      :updated_at => row[4]
    })
    puts "Customer row #{row} added!"
  end
  Merchant.delete_all
  merchant_file = "lib/data/merchants.csv"

  CSV.foreach(merchant_file, :headers => true) do |row|
    Merchant.create!({
      :name => row[1],
      :created_at => row[2],
      :updated_at => row[3]
    })
    puts "Merchant row #{row} added!"
  end


  Invoice.delete_all
  invoice_file = "lib/data/invoices.csv"

  CSV.foreach(invoice_file, :headers => true) do |row|
    Invoice.create!({
      :customer_id => row[1],
      :merchant_id => row[2],
      :status => row[3],
      :created_at => row[4],
      :updated_at => row[5]
    })
    puts "Invoice row #{row} added!"
  end

  Item.delete_all
  item_file = "lib/data/items.csv"

  CSV.foreach(item_file, :headers => true) do |row|
    Item.create!({
      :name => row[1],
      :description => row[2],
      :unit_price => row[3],
      :merchant_id => row[4],
      :created_at => row[5],
      :updated_at => row[6]
    })
    puts "Item row #{row} added!"
  end

  InvoiceItem.delete_all

  invoice_items_file = "lib/data/invoice_items.csv"

  CSV.foreach(invoice_items_file, :headers => true) do |row|
    InvoiceItem.create!({
      :item_id => row[1],
      :invoice_id => row[2],
      :quantity => row[3],
      :unit_price => row[4],
      :created_at => row[5],
      :updated_at => row[6]
    })
    puts "InvoiceItem row #{row} added!"
  end

  Transaction.delete_all

  transactions_file = "lib/data/transactions.csv"

  CSV.foreach(transactions_file, :headers => true) do |row|
    Transaction.create!({
      :invoice_id => row[1],
      :credit_card_number => row[2],
      :result => row[4],
      :created_at => row[5],
      :updated_at => row[6]
    })
    puts "Transaction row #{row} added!"
  end
end

