module Admin
  class UsersController < BaseController

    def index
      @users = User.all
    end

    def ban
      @user = User.find(params[:id])
      @user.update(banned: true)
      redirect_to admin_users_path, notice: 'User banned'
    end

    def unban
      @user = User.find(params[:id])
      @user.update(banned: false)
      redirect_to admin_users_path, notice: 'User unbanned'
    end
  end
end
