require 'spec_helper'
require_relative '../lib/generator/random_id_generator'

describe Openweather do

  context 'generating random id from yaml file'

    before(:all) do
      @city_id = RandomIdGenerator.new.get_random_id
    end

    it 'id should exist within yaml file' do
      p @city_id
    end
end
