class UnitsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_president, only: [:index, :edit]
    
    def show
        @unit = current_user.unit
    end
    
    def index
        @units = Unit.all
    end
    
    def edit
       @unit = Unit.find(params[:id]) 
    end
end
