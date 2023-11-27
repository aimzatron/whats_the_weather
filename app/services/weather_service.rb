class WeatherService < ApplicationService
    def initialize
        @client = OpenWeather::Client.new(
            api_key: Rails.application.credentials[:open_weather_api][:key]
         )
    end

    def weather_by_zip_code(zip_code)
        data = @client.current_zip(zip_code,'US')
        { current_temp: data.main.temp_f, 
          temp_low: data.main.temp_min_f, 
          temp_high: data.main.temp_max_f,
          weather: data.weather.first.main
        }
    end
end