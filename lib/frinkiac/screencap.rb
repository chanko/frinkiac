require 'faraday'
require 'json'

SITE_URL = 'https://frinkiac.com'
API_URL = "#{SITE_URL}/api/search"

module Frinkiac
  class Screencap
    attr_reader :id, :episode, :timestamp

    def initialize(attributes)
      @id = attributes['Id']
      @episode = attributes['Episode']
      @timestamp = attributes['Timestamp']
    end

    def image_url
      "#{SITE_URL}/img/#{episode}/#{timestamp}.jpg"
    end

    def self.search(query)
      response = Faraday.get("#{API_URL}?q=#{query}")
      screencaps = JSON.parse(response.body)

      screencaps.map { |attributes| new(attributes) }
    end

    def self.random(query)
      screencaps = search(query)
      screencaps[rand(screencaps.size)] if screencaps.any?
    end
  end
end