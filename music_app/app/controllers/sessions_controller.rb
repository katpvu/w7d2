class SessionsController < ApplicationController

    #rendering log in page
    def new
        @user = User.new
        render :new
    end

    #logging in a user
    #reset user's session_token and session[:session_token], then redirect to UsersController#show
    def create
        incoming_email = params[:user][:email]
        incoming_password = params[:user][:password]
        @user = User.find_by_credentials(incoming_email, incoming_password)
        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    #logging out a user and redirecting them to a login/sign up page
    def destroy
        logout
        redirect_to new_session_url
    end

end