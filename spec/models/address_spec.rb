require "rails_helper"

RSpec.describe Address, type: :model do
  context 'with a valid address' do
    it 'sets the cache key to the zip_code' do
      address = Address.create(zip_code: '90210')

      expect(address.cache_key).to eq(address.zip_code)
    end
  end

  context 'with an invalid address' do
    it 'returns an invalid error' do
        expect(Address.create(zip_code: nil)).to_not be_valid
    end
  end
end