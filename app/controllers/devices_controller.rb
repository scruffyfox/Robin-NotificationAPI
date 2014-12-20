require 'json'

class DevicesController < ApplicationController
  respond_to :json

  #show all devices from a user
  def index
    if (Rails.env != "production")
      @devices = User.find_by_id(params[:user_id]).devices
      render :json => @devices, :layout => false
    else
      render :nothing => true
    end
  end

  #show device from id
  def show
    if (Rails.env != "production")
      @device = Device.find_by_id(params[:device_id])
      render :json => @device, :layout => false
    else
      render :nothing => true
    end
  end

  #deletes all devices if an id is not set, or a specific device if ic is
  def delete_device
    if (params[:device_id] == nil)
      @devices = User.find_by_id(params[:user_id]).devices.destroy_all
    else
      puts params[:device_id]
      @device = Device.find_by_id(params[:device_id])
      puts @device.to_json
      if (@device != nil)
        @device.destroy
      end
    end

    render :nothing => true
  end

  #adds a device to a user
  def add_device
    begin
      @device = User.find_by_id(params[:user_id]).devices.find_by_id(params[:device][:id])

      if (@device == nil)
        @device = User.find_by_id(params[:user_id]).devices.new(params[:device])
        @device.save!
      else
        @device.update_attributes(params[:device])
      end

      render :json => @device, :layout => false
    rescue ActiveRecord::RecordNotUnique => e
      @device = User.find_by_id(params[:user_id]).devices.find_by_id(params[:device][:id])
      @device.update_attributes(params[:device])
      render :json => @device, :layout => false
    rescue NoMethodError => e
      error(500, 2, "User does not exist")
    end
  end

  #updates a device
  def update_device
    @device = User.find_by_id(params[:user_id]).devices.find_by_id(params[:device_id])
    @device.update_attributes(params[:device])
    render :json => @device, :layout => false
  end

  def error(status, code, message)
    render :json => {:error => {:response_code => code, :message => message}}.to_json, :status => status
  end
end