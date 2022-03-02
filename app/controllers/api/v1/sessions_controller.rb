module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.where(email: params[:email]).first
        if user&.valid_password?(params[:password])
          render json: user.as_json(only: %i[authentication_token email]), status: :created
        else
          head(:unauthorised)
        end
      end
    end
  end
end