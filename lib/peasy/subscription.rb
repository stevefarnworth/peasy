module Peasy
  class Subscription
    def self.find(key, id)
      require 'net/http'

      uri = URI.parse("https://api.lemonsqueezy.com/v1/subscriptions/#{id}")
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.instance_of? URI::HTTPS
      
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Content-Type'] = 'application/vnd.api+json'
      request['Accept'] = 'application/vnd.api+json'
      request['Authorization'] = "Bearer #{key}"
      
      response = http.request(request)
      response = JSON.parse(response.body)

  
    end

    def self.cancel(key, id)
      require 'net/http'

      uri = URI.parse("https://api.lemonsqueezy.com/v1/subscriptions/#{id}")
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.instance_of? URI::HTTPS
      
      request = Net::HTTP::Patch.new(uri.request_uri)
      request['Content-Type'] = 'application/vnd.api+json'
      request['Accept'] = 'application/vnd.api+json'
      request['Authorization'] = "Bearer #{key}"
      request.body = {data: {type: "subscriptions", id: "#{id}", attributes: {cancelled: true}}}.to_json
      
      response = http.request(request)
      response = JSON.parse(response.body)

    end
  end
end