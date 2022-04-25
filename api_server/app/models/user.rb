class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true

    has_many :ingredients, dependent: :destroy
    has_many :recipes, dependent: :destroy

    def as_public_json
        self.as_json.except('password_digest')
    end
end
