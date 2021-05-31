require 'json'

class SessionsController < ApplicationController
    skip_before_action :login_required, :only => [:new, :create]

    def create
        if params[:username]
            begin
                res = Net::HTTP.post URI('https://hosp-auth.herokuapp.com/auth/login'), { "username" => params[:username], "password" => params[:password] }.to_json, "Content-Type" => "application/json"
                body = JSON.parse(res.body)
                if body['error'] == 'Invalid username or password'
                    redirect_to signup_path, notice: "Username ou senha incorretos."
                else
                    session[:user_id] = body["user"]["id"]
                    session[:user_username] = body["user"]["username"]
                    session[:user_authority] = body["user"]["authority"]
                    session[:user_name] = body["user"]["name"]
                    redirect_to root_path
                end
            rescue StandardError
                redirect_to signup_path, notice: "Sistema temporariamente fora do ar."
            end
        end
    end

    def destroy
        session[:user_id] = nil
        session[:user_username] = nil
        session[:user_authority] = nil
        session[:user_name] = nil
        redirect_to root_path
    end
end
