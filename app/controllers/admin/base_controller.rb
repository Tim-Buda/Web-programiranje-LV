class Admin::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_admin

    def index
        @reservations = Reservation.all
    end

    protected

    def verify_admin
    end
end
