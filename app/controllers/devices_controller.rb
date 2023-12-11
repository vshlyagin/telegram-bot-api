class DevicesController < ApplicationController
    before_action :client_init
    
    def index
      body = @client.get_devices
      render json: body
    end

    def show
      body = @client.get_device(params[:id])
      render json: body
    end

    private 
    def client_init
      #https://web-crunch.com/posts/the-complete-guide-to-ruby-on-rails-encrypted-credentials
      login = Rails.application.credentials.dig(:owen_data, :login)
      password = Rails.application.credentials.dig(:owen_data, :password)
      host = "https://api.owencloud.ru"
      @client = Client.new(login, password, host)
    end
end
