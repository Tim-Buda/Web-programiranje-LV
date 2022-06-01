class ReservationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @reservations = current_user.reservations.all
    end

    def create
        reservation = current_user.reservations.new(reservation_params)
        respond_to do |format|
            if reservation.save
                format.html { redirect_to reservations_path, notice: "Rezervacija je uspješno kreirana"}
                format.json { render :show, status: :created, location: reservation }
            else
                format.html { render :index, notice: "Ret"}
                format.json { render json: reservation.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def reservation_params
        params.require(:reservation).permit(:date_to, :date_from, :apartment_id)
    end
end
