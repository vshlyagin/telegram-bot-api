class Client
    attr_reader :login, :password, :host

    def initialize(login, password, host)
      @login = login
      @password = password
      @host = host
    end

    def get_devices
      response = request ("/v1/device/index")
    end

    def get_device(id)
      response = request ("/v1/device/#{id}")
    end

    private 

    def request (uri)
      auth
      response = HTTParty.post(@host + uri,
        :body => "",
        :headers => {'Authorization' => "Bearer #{@token}"}
      )
      json_body=JSON.parse(response.body) 
    end

    def auth
      response = HTTParty.post(@host + "/v1/auth/open",
        :body => { "login" => "#{@login}","password" => "#{@password}"}.to_json,
      )
      @token = response["token"]
    end
end