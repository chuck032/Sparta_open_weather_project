require 'spec_helper'
require_relative '../lib/generator/random_id_generator'
require_relative '../lib/generator/json_city_generator'

describe JsonCityGenerator do

  context 'Linking random id to JSON object and Open Weather API' do
    before(:all) do
      @city_ids = RandomIdGenerator.new
      @single_weather = OpenWeather.new.single_city
      @rand_id = @city_ids.get_random_id
      @single_weather.get_single_city(@rand_id)
      @json_hash = JsonCityGenerator.new
    end

    it "Should return a hash" do
      expect(@json_hash.find_json_hash(@rand_id)).to be_kind_of Hash
    end

    it 'Should match random id and id of json hash and API' do
      expect(@json_hash.get_json_hash(@rand_id)).to eq(@rand_id).and eq(@single_weather.get_id)
    end

    it 'Should have matching country names' do
      expect(@json_hash.get_json_country(@rand_id)).to eq(@single_weather.get_country)
    end

    it 'Should have matching city names' do
      expect(@json_hash.get_json_city(@rand_id)).to eq(@single_weather.get_city)
    end

    it 'Should have matching latitudes' do
      expect(@json_hash.get_json_lat(@rand_id)).to eq(@single_weather.get_latitude)
    end

    it 'Should have matching longitudes' do
      expect(@json_hash.get_json_lon(@rand_id)).to eq(@single_weather.get_longitude)
    end
  end
end
