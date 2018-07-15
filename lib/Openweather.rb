require_relative 'services/single_city'
require_relative 'generator/random_id_generator'

class OpenWeather
  include HTTParty

  base_uri 'http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={2c86cf1a3968fd03072f7a0ebaaa384e}'

  def single_city
    SingleCity.new
  end

end
