class User < ApplicationRecord
    has_secure_password
    #validates presence of password and allows us to use authenticate
    has_many :scores
    validates :username, presence: true
    validates :username, uniqueness: true
end
