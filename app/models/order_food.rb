class OrderFood < ApplicationRecord
    belongs_to :food
    belongs_to :chef, required: false
    def check_order
        
    @order = OrderFood.where(order_id: order_id)
        if @order.all?{|e| e.status = true}
          @complete_order = {order_id: order_id, status:"completed"}
          SendWorker.perform(@complete_order)
        end
    end
end
