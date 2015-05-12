module Moderator
  class BaseController < ActionController::Base
    before_action :authenticate_user!
    before_action :check_if_moderator

    protected

    def check_if_moderator
      unless current_user.has_role?('moderator') || current_user.has_role?('admin')
        redirect_to root_path, alet: 'Forbiden'
      end
    end
  end
end
