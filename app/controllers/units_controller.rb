class UnitsController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @unit = current_user.unit
    end
end
