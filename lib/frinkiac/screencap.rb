require 'faraday'
require 'json'
require 'word_wrap'
require 'base64'

SITE_URL = 'https://frinkiac.com'
API_URL = "#{SITE_URL}/api/search"
CAPTION_URL = "#{SITE_URL}/api/caption"

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

    def meme_url(caption = nil)
      caption = self.caption if caption.nil?
      caption = caption.join("\n") if caption.is_a?(Array)

      "#{SITE_URL}/meme/#{episode}/#{timestamp}.jpg?b64lines=#{Base64.strict_encode64 caption}"
    end

    def caption
      @caption ||= begin
        response = Faraday.get("#{CAPTION_URL}?e=#{episode}&t=#{timestamp}")
        body = JSON.parse(response.body)

        format_captions(body['Subtitles'].collect { |s| s['Content'] })
      end
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

    private
    def format_captions(captions)
      caption_string = captions.join(' ')

      WordWrap.ww(caption_string, 25).chop
    end
  end
end
