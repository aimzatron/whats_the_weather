require 'rails_helper'

RSpec.describe 'Address', type: :request do
    context '#new' do
        it "renders the new page" do            
            get(new_address_path)
            expect(response).to be_successful
        end
    end
end