module API
    module V1
        class UsersController < ApplicationController

            def create
                user = User.new(user_params)
                if user.save
                  render json: { status: 'Success', message: 'Record saved', data: user }, status: 201
                end
            end

            private

            def user_params
                params.require(:user).permit(:name, :email, :password, :role, :currency)
            end
        end
    end
end