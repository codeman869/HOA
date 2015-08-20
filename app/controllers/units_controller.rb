class UnitsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_president, only: [:index]
    
    def show
        @unit = current_user.unit
    end
    
    def index
        @units = Unit.all
    end
end
