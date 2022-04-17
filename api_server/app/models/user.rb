class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true

    def as_public_json
        self.as_json.except('password_digest')
    end
end
