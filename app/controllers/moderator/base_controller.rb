module Moderator
  class BaseController < ActionController::Base
    before_action :authenticate_user!
    before_action :check_if_moderator

    protected

    def check_if_moderator
      current_user.has_role?('moderator')
    end
  end
end
