class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit_price, :merchant_id
end
    #t.string "name"
    #t.integer "unit_price"
    #t.bigint "merchant_id"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.index ["merchant_id"], name: "index_items_on_merchant_id"
