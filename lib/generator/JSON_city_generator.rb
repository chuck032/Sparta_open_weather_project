require 'yaml'
require 'httparty'
require 'json'

class JsonCityGenerator
  include HTTParty

  def initialize
    @json_hash = JSON.parse(File.read('city.list.json'))
  end


  def get_json_hash
    json_array = @json_hash
  end

  def get_json_id
    json_array.each do |x|
      p json_array[x]['id']
    end
  end



end

check = JsonCityGenerator.new
p check.get_json_hash.get_json_id
