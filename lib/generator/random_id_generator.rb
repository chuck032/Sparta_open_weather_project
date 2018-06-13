require 'yaml'
require 'httparty'
require 'json'

class RandomIdGenerator
  include HTTParty

  attr_reader :city_ids

  # Method to extract the Yaml file
  def initialize
    @city_ids = YAML.load_file('city_id.yml')
  end

  # Method to get a random id from the array
  def get_random_id
    @city_ids.sample
  end

  # Method to get the legnth of the random id
  def get_random_id_length
    @city_ids.sample.digits.count
  end

end
