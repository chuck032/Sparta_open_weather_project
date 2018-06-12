require 'yaml'
require 'httparty'
require 'json'
require_relative 'random_id_generator'

class JsonCityGenerator
  include HTTParty

  def json_array
    JSON.parse(File.read('city.list.json'))
  end

  def find_json_hash(id)
    json_array.each do |x|
      if x['id'] == id
        return x
      end
    end
  end

  def get_json_hash(id)
    find_json_hash(id)['id']
  end

  def get_json_country(id)
    find_json_hash(id)['country']
  end

  def get_json_city(id)
    find_json_hash(id)['name']
  end

  def get_json_lat(id)
    find_json_hash(id)['coord']['lat'].round(2)
  end

  def get_json_lon(id)
    find_json_hash(id)['coord']['lon'].round(2)
  end
end
