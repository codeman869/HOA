class UsersController < ApplicationController
    
    before_action :require_admin
    
    def index
        @users = User.all
    end
    
    def edit
        @user = User.find(params[:id])
    end
end
