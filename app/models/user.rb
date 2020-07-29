class User < ApplicationRecord
    has_many :scores
    validates :username, :password, presence: true
    validates :username, :password, uniqueness: true
end
