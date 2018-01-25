class User < ActiveRecord::Migration[4.2]::Base  
  has_many :journals
  has_secure_password
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

   def slug
        username.downcase.gsub(" ", "-")
     end

     def self.find_by_slug(slug)
        User.all.find do |user|
          user.slug == slug
        end
     end

end
