class AdminDashboardsController < ApplicationController
    before_action :authenticate_admin!

    def show
        @pendingXacts = Transaction.where(status: "pending")

        if @pendingXacts == nil
            @pendingXacts = []
        end
    end
end
