module Admin
  class PhysiciansController < ApplicationController
    http_basic_authenticate_with :name => "admin", :password => "password"\
    before_action :check_admin_permissions

    def index
      @physicians = Physician.all
    end

    private

    # def check_admin_permissions
    #   if !current_user.admin?
    #     flash[:error] = 'You are not an admin!'
    #     redirect_to root_path
    #   end
    # end
  end
end