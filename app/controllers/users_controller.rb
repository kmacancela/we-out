class UsersController < ApplicationController
    skip_before_action :authenticated, only: [:new, :create]

    def new 
        @user = User.new 
    end
    
    def create
        user = User.create(user_params)
        if user.valid?
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          flash[:errors] = user.errors.full_messages
          redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username,:password)
    end

end

