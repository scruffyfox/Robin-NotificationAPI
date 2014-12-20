require 'active_support/string_inquirer'
def Rails.env
  @_env ||= ActiveSupport::StringInquirer.new(ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "development")
end