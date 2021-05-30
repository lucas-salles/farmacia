require 'json'

class SessionsController < ApplicationController
    skip_before_action :login_required, :only => [:new, :create]

    def create
        if params[:username]
            begin
                uri = URI('http://192.168.0.11:3000/login')
                res = Net::HTTP.post_form(uri, 'username' => params[:username], 'password' => params[:password])
                body = JSON.parse(res.body)
                if body['error'] == 'Invalid username or password'
                    redirect_to signup_path, notice: "Username ou senha incorretos."
                else
                    session[:user_id] = body["user"]["id"]
                    session[:user_authority] = body["user"]["authority"]
                    redirect_to root_path
                end
            rescue StandardError
                redirect_to signup_path, notice: "Sistema temporariamente fora do ar."
            end
        end
    end

    def destroy
        session[:user_id] = nil
        session[:user_authority] = nil
        redirect_to root_path
    end
end
