class DevicesController < ApplicationController
    def index
      json_body, code = Integration::Owen::Client.new.get_devices
      render json: json_body, status: code
    end

    def show
      json_body, code = Integration::Owen::Client.new.get_device(params[:id])
      render json: json_body, status: code
    end
end
