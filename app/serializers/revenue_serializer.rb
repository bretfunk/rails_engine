class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    object["merchants.name"]
  end
end
