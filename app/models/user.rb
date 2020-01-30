class User < ActiveRecord::Base 
  validates_presence_of :username, :password, :balance
#   attr_accessor :username, :password, :balance 
  
#   @@all = []
  
# def initialize(params)
#   @username = params[:username]
#   @password = params[:password]
#   @age = params[:balance]
#   @@all << self
# end
 
# def self.all 
#   @@all
# end

end