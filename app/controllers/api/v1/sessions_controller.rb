module Api
    module V1
        class SessionsController < ApplicationController
        
            def create
                user = User.where(email: params[:email]).first
                if user&.valid_password?(params[:password])
                    session[:user_id] = user.id
                    render json: user.as_json(only: [:id, :email]), status: :created
                else
                    head(:unauthorised)
                end
            end
            
        end
    end
end