class AdminDashboardsController < ApplicationController
    before_action :authenticate_admin!


    def show

        @current_user = current_admin
        @uid = @current_user.id


        @pendingXacts = Transaction.GetPendingAdminApproval

        if @pendingXacts == nil
            @pendingXacts = []
        end
    end

end
