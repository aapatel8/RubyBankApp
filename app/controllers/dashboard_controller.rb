class DashboardController < ApplicationController
    before_action :authenticate_user!

    def show 
        if !user_signed_in?
            redirect_to :controller => 'devise', :action => 'sessions#new'
        end
    end
end
