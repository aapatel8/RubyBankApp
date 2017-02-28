class AdminDashboardsController < ApplicationController
    before_action :authenticate_admin!

    def show
        @pendingXacts = Transaction.GetPending

        if @pendingXacts == nil
            @pendingXacts = []
        end
    end

end
