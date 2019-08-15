class SendWorker
  include Sidekiq::Worker

  def perform(status_map)
    HTTParty.post("http://192.168.0.22:9090/api/v1/send", body:{from: "+60 192022325", to: "+60 192022325", message: "hi"}.to_json)
    
  end
end
