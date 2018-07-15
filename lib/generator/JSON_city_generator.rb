require 'yaml'
require 'httparty'
require 'json'
require_relative 'random_id_generator'

class JsonCityGenerator
  include HTTParty

  def json_array
    JSON.parse(File.read('city.list.json'))
  end

  # Method to match the ID with the JSON Array and return a Hash
  def find_json_hash(id)
    json_array.each do |x|
      if x['id'] == id
        return x
      end
    end
  end

  # Method to get the ID of the JSON Hash
  def get_json_hash(id)
    find_json_hash(id)['id']
  end

  # Method to get the country from the JSON Hash
  def get_json_country(id)
    find_json_hash(id)['country']
  end

  # Method to get the city name from the JSON Hash
  def get_json_city(id)
    find_json_hash(id)['name']
  end

  # Method to get the latitude from the JSON Hash
  def get_json_lat(id)
    find_json_hash(id)['coord']['lat'].round(2)
  end

  # Method to get the longitude from the JSON Hash
  def get_json_lon(id)
    find_json_hash(id)['coord']['lon'].round(2)
  end
end
