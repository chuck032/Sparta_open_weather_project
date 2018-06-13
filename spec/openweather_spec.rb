require 'spec_helper'
require_relative '../lib/generator/random_id_generator'
require_relative '../lib/generator/json_city_generator'

describe OpenWeather do

  context 'Requesting weather information on a single ID' do

    before(:all) do
      @city_ids = RandomIdGenerator.new
      @single_weather = OpenWeather.new.single_city
      @single_weather.get_single_city(@city_ids.get_random_id)
    end

    it 'Should return an array when looking for weather' do
      expect(@single_weather.get_weather).to be_kind_of Array
    end

    it 'Should return longitude as integer or float' do
      expect(@single_weather.get_longitude).to be_a(Integer).or be_a(Float)
    end

    it 'Should return latitude as integer or float' do
      expect(@single_weather.get_latitude).to be_a(Integer).or be_a(Float)
    end

    it 'Should return main weather as string' do
      expect(@single_weather.get_weather_main).to be_kind_of String
    end

    it 'Should return description weather as string' do
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

    it 'Should return an ID as an integer' do
      expect(@single_weather.get_id).to be_kind_of Integer
    end

    it 'Should have an ID between 5 and 8' do
      expect(@single_weather.get_id_length).to be_between(5,8)
    end
  end
end
