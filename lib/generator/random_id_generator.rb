require 'yaml'
require 'httparty'
require 'json'

class RandomIdGenerator
  include HTTParty

  attr_reader :city_ids

  def initialize
    @city_ids = YAML.load_file('city_id.yml')
  end

  def get_random_id
    @city_ids.sample
  end

  def get_random_id_length
    @city_ids.sample.digits.count
  end


end

# check = RandomIdGenerator.new
# p check.city_ids.class
