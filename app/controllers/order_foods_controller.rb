class OrderFoodsController < ApplicationController
  before_action :set_order_food, only: [:show, :update, :destroy]

  # GET /order_foods
  # def index
  #   @order_foods = OrderFood.all

  #   render json: @order_foods
  # end

  # # GET /order_foods/1
  # def show
  #   render json: @order_food
  # end

  # # POST /order_foods
  # def create
  #   @order_food = OrderFood.new(order_food_params)

  #   if @order_food.save
  #     render json: @order_food, status: :created, location: @order_food
  #   else
  #     render json: @order_food.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /order_foods/1
  # def update
  #   if @order_food.update(order_food_params)
  #     render json: @order_food
  #   else
  #     render json: @order_food.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /order_foods/1
  # def destroy
  #   @order_food.destroy
  # end


  def create
    id = params["order_id"]
    print "order is #{id}\n"

    params["foods"].each do |food_hash|
      @order = OrderFood.create(food_id: food_hash["food_id"], quantity: food_hash["food_quantity"])
      # byebug
      @order.update({order_id: id })
      print "adding the job\n"
      puts @order.order_id
      # byebug
      CookingWorker.perform_async(@order.order_id)
    end

    render json: @order_food
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_food
      @order_food = OrderFood.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_food_params
      params.require(:order_food).permit(:food_id, :status, :order_id, :quantity)
    end
end
