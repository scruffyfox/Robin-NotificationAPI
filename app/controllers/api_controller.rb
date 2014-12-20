class ApiController < ApplicationController
  respond_to :json

  def index
    error(404, 1, "Request not found")
  end

  def error(status, code, message)
    render :json => {:error => {:response_code => code, :message => message}}.to_json, :status => status
  end
end