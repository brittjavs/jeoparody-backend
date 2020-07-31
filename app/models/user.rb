class User < ApplicationRecord
    has_secure_password
    #has secure password validates presence of password
    has_many :scores
    validates :username, presence: true
    validates :username, uniqueness: true
end
