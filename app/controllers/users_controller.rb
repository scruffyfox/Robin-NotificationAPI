require 'json'

class UsersController < ApplicationController
  respond_to :json

  #show user and devices from id
  def index
    if (Rails.env != "production")
      @users = User.all.select{|i| i.devices.length > 0}
      render :json => @users.to_json(:include => :devices), :layout => false
    else
      render :nothing => true
    end
  end

  #show user and devices from id
  def show
    if (Rails.env != "production")
      @user = User.find_by_id(params[:id])
      render :json => @user.to_json(:include => :devices), :layout => false
    else
      render :nothing => true
    end
  end

  #adds a new user
  def add_user
    @devices = nil
    @user = nil

    if (params[:user][:devices] != nil)
      @devices = params[:user][:devices]
      params[:user].delete :devices
    end

    begin
      @user = User.new(params[:user])
      @user.last_updated = DateTime.now().to_i
      @user.save!

      if (@devices)
        @devices.each do |dev|

          begin
            @device = Device.new(dev)
            @device.user_id = @user.id
            @device.save!
          rescue ActiveRecord::RecordNotUnique => e
            @device = Device.find_by_id(dev['id'])
            @device.update_attributes(dev)
          end
        end
      end
    rescue ActiveRecord::RecordNotUnique => e
      @user = User.find_by_id(params[:user][:id])
      @user.update_attributes(params[:user])
      @user.last_updated = DateTime.now().to_i
      @user.save!
    end

    render :json => @user.to_json(:include => :devices), :layout => false
  end

  #updates a user
  def update_user
    @user = User.find_by_id(params[:id])
    @user.last_updated = DateTime.now().to_i
    @user.update_attributes(params[:user])
    @user.save!
    render :json => @user.to_json(:include => :devices), :layout => false
  end

  #deletes a user and all the devices
  def delete_user
    @user = User.find_by_id(params[:id]).destroy
    render :nothing => true
  end

  def error(status, code, message)
    render :json => {:error => {:response_code => code, :message => message}}.to_json, :status => status
  end
end