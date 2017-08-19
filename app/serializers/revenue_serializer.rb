class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    (object[object.keys.first].to_f / 100).to_s
  end
end
