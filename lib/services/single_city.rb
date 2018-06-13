require 'httparty'
require 'json'

class SingleCity
  include HTTParty

  base_uri 'http://api.openweathermap.org'

  def get_single_city(id)
    @single_city_data = JSON.parse(self.class.get("/data/2.5/weather?id=#{id}&APPID=2c86cf1a3968fd03072f7a0ebaaa384e").body)
  end

  # Method to get the coordinates
  def get_coord
    @single_city_data['coord']
  end

  # Method to get the longitude
  def get_longitude
    get_coord['lon']
  end

  # Method to get the latitude
  def get_latitude
    get_coord['lat']
  end

  # Method to get the weather
  def get_weather
    @single_city_data['weather']
  end

  # Method to get the main weather
  def get_weather_main
    get_weather[0]["main"]
  end

  # Method to get the weather description
  def get_weather_description
    get_weather[0]["description"]
  end

  # Method to get the temperature
  def get_temperature
    @single_city_data["main"]["temp"]
  end

  # Method to get the pressure
  def get_pressure
    @single_city_data["main"]["pressure"]
  end

  # Method to get the country
  def get_country
    @single_city_data["sys"]["country"]
  end

  # Method to get the City name
  def get_city
    @single_city_data["name"]
  end

  # Method to get the ID
  def get_id
    @single_city_data["id"]
  end

  # Method to get the length of the ID
  def get_id_length
    get_id.digits.count
  end

end
