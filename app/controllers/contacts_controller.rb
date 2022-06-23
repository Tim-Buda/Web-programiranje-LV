class ContactsController < ApplicationController
    def send_mail
        ContactMailer.with(
            user_email: params[:email], first_name: params[:first_name], 
            last_name: params[:last_name], telephone: params[:telephone],
            start_date: params[:start], end_date: params[:end],
            apartment: params[:apartment]
        ).reservation_mail.deliver_now
    end
    
end
