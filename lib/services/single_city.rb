require 'httparty'
require 'json'


class SingleCity
  include HTTParty

  base_uri 'http://api.openweathermap.org'

  def get_single_city(id)
    @single_city_data = JSON.parse(self.class.get("/data/2.5/weather?id=524901&APPID=2c86cf1a3968fd03072f7a0ebaaa384e").body)
  end

  def get_longitude
    @single_city_data['coord']['lon']
  end

  def get_latitude
    @single_city_data['coord']['lat']
  end
end

# test = SingleCity.new
# p test.get_single_city(10722858)
