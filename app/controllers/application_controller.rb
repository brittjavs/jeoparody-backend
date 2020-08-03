class ApplicationController < ActionController::API
    before_action :authorized

    # JWT.encode takes two arguments, the payload object and a string that represents a “secret”. The method encode_token will return the token generated by JWT
    def encode_token(payload)
      JWT.encode(payload, 's3cr3t')
    end
  
    def auth_header
      request.headers['Authorization']
    #   this will contain a token generated by JWT and will be in the format of Bearer <token>, which is what auth_header will return
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
            # To get just the token, we will use the .split(" ")[1] method on Bearer <token>
        begin
            #   JWT.decode takes in four arguments, the token to decode, the secret string that was assigned when encoding, a true value, and the algorithm (‘HS256’ here). Otherwise, if there is an error, it will return nil.
          JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def logged_in_user
        # The return value for decoded_token will represent an array from JWT.decode. We’re only concerned with the first index, which will be an object with a key of “user_id.” (this will come from the User’s controller).
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  
    def logged_in?
      !!logged_in_user
    end
  
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
