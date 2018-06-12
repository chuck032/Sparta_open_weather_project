require 'yaml'
require 'httparty'
require 'json'

class RandomIdGenerator
  include HTTParty

  def initialize
    @city_id = YAML.load_file('../../city_id.yml')
  end

  def get_random_id
    @city_id.sample
  end


end

# test = RandomIdGenerator.new
# p test.get_random_id
