class AdminDashboardsController < ApplicationController
    before_action :authenticate_admin!

    def show
        @pendingXacts = Transaction.GetPendingAdminApproval

        if @pendingXacts == nil
            @pendingXacts = []
        end
    end

end
