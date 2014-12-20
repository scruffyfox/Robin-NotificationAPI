class Device < ActiveRecord::Base
  attr_accessible :id, :user_id, :push_id, :enabled, :follow_enabled
  self.primary_key = :id
  belongs_to :user
end