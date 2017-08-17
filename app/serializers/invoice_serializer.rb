class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status
end
    #t.bigint "customer_id"
    #t.bigint "merchant_id"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.string "status"
    #t.index ["customer_id"], name: "index_invoices_on_customer_id"
    #t.index ["merchant_id"], name: "index_invoices_on_merchant_id"
