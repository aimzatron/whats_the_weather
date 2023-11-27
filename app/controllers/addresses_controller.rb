class AddressesController < ApplicationController
    def index;end

    def new
      @address = Address.new
    end
    
    def create
      @address = Address.new(address_params)

      if @address.save
        redirect_to @address
      else
        flash.now[:error] = 'Could not be saved'
        render :new
      end
    end

    def show
        @address = Address.find(params[:id])
        @cached = Rails.cache.exist?(@address.zip_code)
        @weather_data = WeatherService.new.weather_by_zip_code(@address.zip_code)
        Rails.cache.fetch(@address.zip_code, expires_in: 30.minutes) do
          @weather_data
        end
    end

    private

    def address_params
      params.require(:address).permit(:address_1, :address_2, :city, :state, :zip_code)
    end
end