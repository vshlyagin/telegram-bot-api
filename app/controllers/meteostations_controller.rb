class MeteostationsController < ApplicationController

    before_action :auth

    def index
        meteostations = Meteostation.all
        render json: meteostations.as_json(except: [:created_at, :updated_at])
    end

    def create
        
        json_body = get_info_meteostation(60546)
        temp = json_body["parameters"].find { |param| param["code"] == "wTempCloud" }
        wet = json_body["parameters"].find { |param| param["code"] == "wHummidCloud" }
        co = json_body["parameters"].find { |param| param["code"] == "wCo2Cloud" }
        name = json_body["name"]

        id_device = json_body["id"]
        temperatureValue = temp["value"]
        wetValue = wet["value"]
        coValue = co["value"]
        begin
            ms = Meteostation.new(name: name, temp: temperatureValue, wet: wetValue, co: coValue, id_device: id_device)
            
            if ms.save!
            render json: {
                "id": "#{id_device}",
                "name": "#{name}",
                "Температура": "#{temperatureValue}",
                "Влажность": "#{wetValue}",
                "Со2": "#{coValue}"
            }, status: :created
            end
            
            rescue ActiveRecord::RecordNotUnique => e
                render json: { "error": "Метеостанция с данным id уже добавлена" }
            end
    end


    private
        def auth
            response = HTTParty.post("https://api.owencloud.ru/v1/auth/open",
                :body => { "login" => "demo@owen.ru","password" => "demo123"}.to_json,
            )
            @token = response["token"]
        end


        def get_info_meteostation(devise_id)
            response = HTTParty.post("https://api.owencloud.ru/v1/device/#{devise_id}",
                :body => "",
                :headers => {'Authorization' => "Bearer #{@token}"}
            )
            json_body=JSON.parse(response.body) 

        end

end
