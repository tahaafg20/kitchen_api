class ChefWorker
  include Sidekiq::Worker

  def perform(chef_id, food_id, food_order)
          byebug
          puts "CHEF WORKER"
          chef = Chef.find(chef_id)
          food = Food.find(food_id)
          # byebug
          chef.update(available: false)
          # byebug
          @cook_time = food.cooking_time
          byebug
          @quantity = food_order.quantity
          byebug
          @sleep_time = @cook_time * @quantity
          
          print "Im about to sleep for #{@sleep_time} sec"
          sleep(@sleep_time)
          print "Im up!!"
          food.update(status: true)
          chef.update(available: true)
          
          HTTParty.post("http://192.168.0.22:9090/api/v1/send", body:{from: "+60 192022325", to: "+60 192022325", message: "woker"}.to_json)
  end
end
