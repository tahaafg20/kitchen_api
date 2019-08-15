class OrderFoodSerializer < ActiveModel::Serializer
  attributes :id, :status, :order_id
end
