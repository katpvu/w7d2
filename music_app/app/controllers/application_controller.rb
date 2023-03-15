class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    #crrlll
    
    #current_user to return the current user.
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
    end

    def require_logged_out
    end

    #logged_in? to return a boolean indicating whether anyone is signed in.
    def logged_in?
        !!current_user
    end

    #match session: session_tokens with current_user session_token
    #login!(user) reset the users session token and cookie
    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    #chainging session token for current user, and 
    def logout
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end
end
