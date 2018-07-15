require 'spec_helper'
require_relative '../lib/generator/random_id_generator'
require_relative '../lib/generator/json_city_generator'

describe RandomIdGenerator do

  context 'Requesting a random id from Yaml file' do

    before(:all) do
      @city_ids = RandomIdGenerator.new
    end

    it 'Should return an array of the yaml file' do
       expect(@city_ids.city_ids).to be_kind_of Array
    end

    it 'Should return a random integer' do
       expect(@city_ids.get_random_id).to be_kind_of Integer
    end

    it 'Should return a random integer within the array' do
      expect(@city_ids.city_ids).to include(@city_ids.get_random_id)
    end

    it 'Should have random id between 5 and 8' do
      expect(@city_ids.get_random_id_length).to be_between(5,8)
    end
  end
end
