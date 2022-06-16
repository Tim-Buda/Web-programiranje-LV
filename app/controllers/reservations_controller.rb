class ReservationsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_for_admin, only: [:approve]

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
                format.html {
                    flash[:error] = reservation.errors.messages.values.join("<br/>")
                    redirect_to reservations_path
                }
                format.json { render json: reservation.errors, status: :unprocessable_entity }
            end
        end
    end

    def approve
        reservation = Reservation.find(params[:id])
        respond_to do |format|
            if reservation.approve
                format.html { redirect_to reservations_path, notice: "Rezervacija je uspješno potvrđena"}
                format.json { render :show, status: :created, location: reservation }
            else
                format.html {
                    flash[:error] = "Rezervacija je već potvrđena"
                    redirect_to reservations_path
                }
                format.json { render json: reservation.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def reservation_params
        params.require(:reservation).permit(:date_to, :date_from, :apartment_id)
    end

    
end
