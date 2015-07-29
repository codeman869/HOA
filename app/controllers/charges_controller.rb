class ChargesController < ApplicationController
    
    before_action :authenticate_user!
    
    def new
        @user = current_user
        @unit = @user.unit
    end

    def create
        @unit = current_user.unit
        @amount = @unit.dues
       
       begin
        customer = Stripe::Customer.create(
           :email => params[:email],
           :card => params[:stripeToken]
           )
           
           
        charge = Stripe::Charge.create(
            :customer => customer.id,
            :amount => @amount * 100,
            :description => "HOA Dues for: #{@unit.address}",
            :currency => 'usd'
            
            )
            
        rescue Stripe::CardError => e 
            flash[:error] = e.message
            redirect_to new_charge_url
            
        end
            
            
    end
end
