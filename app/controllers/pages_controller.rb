class PagesController < ApplicationController
    #before_action :authenticate_user!, only: [:contacts]
    def home
    end
    
    def apartments
    end

    def location
    end

    def contacts
        uri = URI("https://api.hnb.hr/tecajn/v1?valuta=EUR")
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        @rate = (response.first["Srednji za devize"].gsub(",",".").to_f).round(3)
    end
end
