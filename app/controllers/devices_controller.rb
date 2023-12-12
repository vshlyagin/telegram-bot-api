class DevicesController < ApplicationController

  include Integration::Owen
    
    def index
      render json: Client.new.get_devices
    end

    def show
      render json: Client.new.get_device(params[:id])
    end
end
