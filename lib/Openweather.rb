require_relative 'services/single_city'

class OpenWeather
  include HTTParty

  base_uri 'http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={2c86cf1a3968fd03072f7a0ebaaa384e}'

  def single_city
    SingleCity.new
  end

end

# test = OpenWeather.new
# p test.single_city.get_single_city(10722858)
