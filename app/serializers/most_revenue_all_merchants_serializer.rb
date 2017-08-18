class MostRevenueAllMerchantsSerializer < ActiveModel::Serializer
  attributes :name, :revenue

  def revenue
    object.revenue / 100.00
  end
end
