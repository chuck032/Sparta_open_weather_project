require 'spec_helper'
require_relative '../lib/generator/random_id_generator'
require_relative '../lib/generator/json_city_generator'


describe OpenWeather do

  context 'requesting a random id from Yaml file' do

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

  context 'requesting weather information on a single ID' do

    before(:all) do
      @city_ids = RandomIdGenerator.new
      @single_weather = OpenWeather.new.single_city
      @single_weather.get_single_city(@city_ids.get_random_id)
    end

    it 'Should return and Array when looking for weather' do
      expect(@single_weather.get_weather).to be_kind_of Array
    end

    it 'Main weather should be String' do
      expect(@single_weather.get_weather_main).to be_kind_of String
    end

    it 'Description weather should be String' do
      expect(@single_weather.get_weather_description).to be_kind_of String
    end

    it 'Should return a float temperature' do
      expect(@single_weather.get_temperature).to be_kind_of Float
    end

    it 'Should return country as string' do
      expect(@single_weather.get_country).to be_kind_of String
    end

    it 'Should return name of city as string' do
      expect(@single_weather.get_city).to be_kind_of String
    end

    it 'Should have an ID between 5 and 8' do
      expect(@single_weather.get_id_length).to be_between(5,8)
    end

  end

  context 'linking random id to json object and Open Weather API' do
    before(:all) do
      @city_ids = RandomIdGenerator.new
      @single_weather = OpenWeather.new.single_city
      @rand_id = @city_ids.get_random_id
      @single_weather.get_single_city(@rand_id)
      @json_hash = JsonCityGenerator.new.json_array(@rand_id)
    end

    it "Should return a hash" do
      expect(@json_hash).to be_kind_of Hash
    end

    it 'random id should match id of json hash and id of API' do
      expect(@json_hash['id']).to eq(@rand_id).and eq(@single_weather.get_id)
    end

    it 'Should have matching country names' do
      expect(@json_hash['country']).to eq(@single_weather.get_country)
    end

    it 'Should have matching country names' do
      # expect(@json_hash['country']).to eq(@single_weather.get_country)
    end



  end
end
