require 'spec_helper'
require_relative '../lib/generator/random_id_generator'

describe OpenWeather do

  context 'requesting weather information on a single ID'

    before(:all) do
      # @city_id = RandomIdGenerator.new
      @single_weather = OpenWeather.new.single_city
      @single_weather.get_single_city(10722858)
    end

    it 'Should return longitude as a float' do
      expect(@single_weather.get_longitude).to be_kind_of Float
    end

    it 'Should return latitude as a float' do
      expect(@single_weather.get_latitude).to be_kind_of Float
    end


end
