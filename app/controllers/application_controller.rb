class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
    #before_action :authenticate_user!
    protect_from_forgery prepend: true
end