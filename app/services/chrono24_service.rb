# app/services/chrono24_service.rb

require 'httparty'

class Chrono24Service
  include HTTParty

  def self.fetch_watch_details(watch_url)
    options = {
      method: 'GET',
      url: 'https://chrono24-api.p.rapidapi.com/watch-details',
      query: {url: watch_url},
      headers: {
        'X-RapidAPI-Key' => Rails.application.credentials.rapidapi[:chrono24_key],
        'X-RapidAPI-Host' => Rails.application.credentials.rapidapi[:chrono24_host]
      }
    }

    response = HTTParty.get(options[:url], query: options[:query], headers: options[:headers])

    if response.success?
      response.parsed_response
    else
      Rails.logger.error "Failed to fetch watch details: #{response}"
      nil # or handle the error as you see fit
    end
  end
end