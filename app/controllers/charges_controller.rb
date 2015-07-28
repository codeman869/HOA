class ChargesController < ApplicationController
    
    before_action :authenticate_user!
    
    def new
    end

    def create
       @amount = 500
       begin
        customer = Stripe::Customer.create(
           :email => 'example@example.com',
           :card => params[:stripeToken]
           )
           
           
        charge = Stripe::Charge.create(
            :customer => customer.id,
            :amount => @amount,
            :description => 'rails stripe customer',
            :currency => 'usd'
            
            )
            
        rescue Stripe::CardError => e 
            flash[:error] = e.message
            redirect_to charges_path
            
        end
            
            
    end
end
