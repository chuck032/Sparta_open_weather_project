require 'httparty'
require 'json'


class SingleCity
  include HTTParty

  base_uri 'http://api.openweathermap.org'

  def get_single_city(id)
    JSON.parse(self.class.get("/data/2.5/weather?id=524901&APPID=2c86cf1a3968fd03072f7a0ebaaa384e").body)
  end


end

# test = SingleCity.new
# p test.get_single_city(10722858)
