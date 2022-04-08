module ApplicationHelper
    def current_payment
        if !session[:payment_id].nil?
            Payment.find(session[:payment_id])
        else
            Payment.new
        end
    end
end
