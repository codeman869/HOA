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
       @users = User.all
    end
    
    def update
        @unit = Unit.find(params[:id])
        if @unit.update_attributes(unit_params)
            redirect_to units_url
        else
            redirect_to edit_unit
        end
    end
    
    def unit_params
       params.require(:unit).permit(:user_id) 
    end
end
