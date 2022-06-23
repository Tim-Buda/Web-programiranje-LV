class ContactMailer < ApplicationMailer

    def reservation_mail
        @user_email = params[:user_email]
        @first_name = params[:first_name] 
        @last_name = params[:last_name]
        @telephone = params[:telephone]
        @start_date = params[:start_date]
        @end_date = params[:end_date]
        @apartment = params[:apartment]
        mail(to: "marko.budimir12@gmail.com", subject: "Zahtjev za rezervaciju - #{@last_name}")
    end
end
