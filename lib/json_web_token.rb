class JsonWebToken
    #encode is for authenticating user and generating token
    def self.create_token(user_object, exp = 24.hours.from_now)
        payload = {user: JSON.parse(user_object.to_json)}
        JWT.encode(payload, 'trebek', 'HS256')
        # hs256 is the hashing algorithm, trebek is the secret which we have to move somewhere secure
    end
    #decode is to check if user's token in each request is correct
    def self.decode_token(token)
        JWT.decode(token, 'trebek', true, {algorithm: 'HS256'})
    end
end