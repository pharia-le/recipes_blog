class User < ActiveRecord::base
    has_secure_password
    has_many :recipes
end