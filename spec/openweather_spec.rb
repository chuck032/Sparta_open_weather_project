require 'spec_helper'
require_relative '../lib/generator/random_id_generator'

describe OpenWeather do

  context 'requesting weather information on a single ID'

    before(:all) do
      # @city_id = RandomIdGenerator.new
      # @city_id.get_random_id
      @single_weather = OpenWeather.new.single_city
      @single_weather.get_single_city(10722858)
    end

    it 'Should return longitude as a float' do
      p @single_weather.get_single_city(10722858)
      expect(@single_weather.get_longitude).to be_kind_of Float
    end

    it 'Should return latitude as a float' do
      expect(@single_weather.get_latitude).to be_kind_of Float
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
    it 'Should return a integer pressure' do
      expect(@single_weather.get_pressure).to be_kind_of Integer
    end









end
