module Admin
  class BaseController < ActionController::Base
    before_action :authenticate_user!
    before_action :check_if_admin

    def check_if_admin
      unless current_user.has_role?('admin')
        redirect_to root_path, alet: 'Forbiden'
      end
    end
  end
end
