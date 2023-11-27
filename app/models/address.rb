class Address < ApplicationRecord
    validates :zip_code, presence: true

    def cache_key
        zip_code
    end
end
