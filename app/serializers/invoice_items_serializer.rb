class InvoiceItemsSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price
end
    #t.bigint "item_id"
    #t.bigint "invoice_id"
    #t.integer "quantity"
    #t.integer "unit_price"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    #t.index ["item_id"], name: "index_invoice_items_on_item_id"
