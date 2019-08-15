class CookingWorker
  include Sidekiq::Worker

  def perform(order_id)
    # byebug
    print "running job"
    @chefs = Chef.where(available: true)
    puts order_id
    # OrderFood.find_by(order_id: order_id, status: nil)
    @food = OrderFood.find_by(order_id: order_id, status: nil)
    puts @food
    if @food && @chefs
      @chefs.each do |chef|
        ChefWorker.perform_async(chef.id, @food.id, @food)
      end
    end
  end
 end
