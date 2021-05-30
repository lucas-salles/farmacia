class UsersController < ApplicationController
    skip_before_action :login_required, :only => [:index, :create]
    
    def index
    end

end
