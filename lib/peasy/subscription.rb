module Peasy

  class Configuration
    attr_accessor :key
  end

  class Subscription
    def self.find(id)
      require 'net/http'

      uri = URI.parse("https://api.lemonsqueezy.com/v1/subscriptions/#{id}")
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.instance_of? URI::HTTPS
      
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Content-Type'] = 'application/vnd.api+json'
      request['Accept'] = 'application/vnd.api+json'
      request['Authorization'] = "Bearer #{Peasy.configuration.key}"
      
      response = http.request(request)
      response = JSON.parse(response.body)
  
    end

    def self.change_payment_method(id)
      self.find(id)['data']['attributes']['urls']['update_payment_method']
    end

    def self.cancel(id)
      require 'net/http'

      uri = URI.parse("https://api.lemonsqueezy.com/v1/subscriptions/#{id}")
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.instance_of? URI::HTTPS
      
      request = Net::HTTP::Patch.new(uri.request_uri)
      request['Content-Type'] = 'application/vnd.api+json'
      request['Accept'] = 'application/vnd.api+json'
      request['Authorization'] = "Bearer #{Peasy.configuration.key}"
      request.body = {data: {type: "subscriptions", id: "#{id}", attributes: {cancelled: true}}}.to_json
      
      response = http.request(request)
      response = JSON.parse(response.body)

    end
  end
end