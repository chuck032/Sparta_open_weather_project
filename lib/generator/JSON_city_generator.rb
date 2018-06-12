require 'yaml'
require 'httparty'
require 'json'
require_relative 'random_id_generator'

class JsonCityGenerator
  include HTTParty

  attr_accessor :json_array

  def json_array(id)
    json_arr = JSON.parse(File.read('city.list.json'))
    json_arr.each do |x|
      if x['id'] == id
        return x
      end
    end
  end

end

# check = JsonCityGenerator.new.json_array(710548)
# p check.get_id
