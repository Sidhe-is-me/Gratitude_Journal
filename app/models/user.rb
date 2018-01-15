class User < ActiveRecord::Base
  has_many :journals
   has_secure_password
end
