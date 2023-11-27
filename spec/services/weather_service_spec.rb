require 'rails_helper'

describe WeatherService do
    let(:weather_for_90210) {
        VCR.use_cassette('weather_service') do
            WeatherService.new.weather_by_zip_code('90210')
        end
    }
    it 'returns a current temp' do
        expect(weather_for_90210[:current_temp]).to eq 61.11
    end

    it 'returns a high temp' do
        expect(weather_for_90210[:temp_low]).to eq 57.74
    end

    it 'returns a low temp' do
        expect(weather_for_90210[:temp_high]).to eq 64.58
    end

    it 'returns weather' do
        expect(weather_for_90210[:weather]).to eq 'Clear'
    end
end