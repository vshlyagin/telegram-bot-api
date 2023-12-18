module Integration
  module Owen 
    class Client
      attr_reader :login, :password, :host
  
      def initialize(login = nil, password = nil, host = nil)
        #https://web-crunch.com/posts/the-complete-guide-to-ruby-on-rails-encrypted-credentials
        @login ||= Rails.application.credentials.dig(:owen_data, :login)
        @password ||= Rails.application.credentials.dig(:owen_data, :password)
        @host ||= "https://api.owencloud.ru"
      end
  
      def get_devices
        response = request ("/v1/device/index")
      end
  
      def get_device(id)
        response = request ("/v1/device/#{id}")
      end
  
      private 
  
      def request(uri)
        auth
        response = HTTParty.post(@host + uri,
          :body => "",
          :headers => {'Authorization' => "Bearer #{@token}"}
        )
        json_body = JSON.parse(response.body)
        status_code = response.code  # Получить HTTP статус
        # Далее вы можете выполнить необходимые действия с полученным статусом
        return json_body, status_code
      end
      
      def auth
        response = HTTParty.post(@host + "/v1/auth/open",
          :body => { "login" => "#{@login}","password" => "#{@password}"}.to_json,
        )
        @token = response["token"]
      end
    end
  end
end