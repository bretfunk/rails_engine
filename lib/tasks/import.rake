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
  merchant_file = "lib/data/customers.csv"

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
end

