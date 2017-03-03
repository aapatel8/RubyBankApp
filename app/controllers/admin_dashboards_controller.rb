class AdminDashboardsController < ApplicationController
    before_action :authenticate_admin!


    def show

        @current_admin = current_admin
        @uid = @current_admin.id


        @pendingXacts = Transaction.GetPendingAdminApproval

        if @pendingXacts == nil
            @pendingXacts = []
        end
    end

end
