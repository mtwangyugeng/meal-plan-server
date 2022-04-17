class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

    def as_public_json
        self.as_json.except('password_digest')
    end
end
