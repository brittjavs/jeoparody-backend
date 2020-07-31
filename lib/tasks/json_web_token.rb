require 'JWT'

class JsonWebToken

    def self.create_token(user_object)
        payload = {user: JSON.parse(user_object.to_json)}
        JWT.encode(payload, 'trebek', 'HS256')
        # hs256 is the hashing algorithm, trebek is the secret
    end

    def self.decode_token(token)
        JWT.decode(token, 'trebek', true, {algorithm: 'HS256'})
    end
end