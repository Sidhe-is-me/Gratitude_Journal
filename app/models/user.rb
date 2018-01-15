class User < ActiveRecord::Base
  has_many :journals
   has_secure_password

   def slug
        username.downcase.gsub(" ", "-")
     end

     def self.find_by_slug(slug)
        User.all.find do |user|
          user.slug == slug
        end
     end

end
