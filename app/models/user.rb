require "net/https"
require 'json'

class User < ActiveRecord::Base
  attr_accessible :id, :access_token
  self.primary_key = :id
  has_many :devices, foreign_key: "user_id", :dependent => :destroy
end