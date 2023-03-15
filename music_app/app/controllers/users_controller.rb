class UsersController < ApplicationController
    #rendering sign up page
    def new 
        @user = User.new
        render :new
    end

    #creating a new user and saving it into the database
    #immediately after signing up, user's should log in and render the home page
    def create
        @user = User.new(user_params)
        if @user.save!
            login!(@user)
            redirect_to user_url(@user.id)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    #rendering the user's page (displays the user's email)
    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    private 
    def user_params
        params.require(:user).permit(:email, :password, :password_digest, :session_token)
    end
end
