class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :credit_card_number, :result
end
    #t.bigint "invoice_id"
    #t.bigint "credit_card_number"
    #t.string "result"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.index ["invoice_id"], name: "index_transactions_on_invoice_id"
