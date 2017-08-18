class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit_price, :merchant_id, :description

  def unit_price
    (object.unit_price.to_f/100).to_s
  end

end
