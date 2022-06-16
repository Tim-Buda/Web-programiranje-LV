class Admin::ReservationsController < ApplicationController
    def destroy
        reservation = Reservation.find(params[:id])
        if reservation.destroy
            redirect_to admin_root_path, notice: "Uspješno obrisano"
        else
            flash[:error] = "Greška"
            redirect_to admin_root_path
        end
    end

    def approve
        reservation = Reservation.find(params[:id])
        respond_to do |format|
            if reservation.approve
                format.html { redirect_to admin_root_path, notice: "Rezervacija je uspješno potvrđena"}
            else
                format.html {
                    flash[:error] = "Rezervacija je već potvrđena"
                    redirect_to admin_root_path
                }
            end
        end
    end
end
