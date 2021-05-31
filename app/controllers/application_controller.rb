require 'uri'
require 'net/http'

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :login_required

    def login_required
        if !logged_in?
              redirect_to signup_path
        end
    end

    def logged_in?
        !!current_user
    end

    helper_method :logged_in?

    def current_user
        if session[:user_id]
          true
        else
          false
        end
    end
    
    helper_method :current_user

    def current_user_admin?
      if session[:user_authority] == "ADMIN"
        true
      else
        false
      end
  end
  
  helper_method :current_user_admin?

end