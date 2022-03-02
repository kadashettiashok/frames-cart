module Api
    module V1
        class LensesController < ApplicationController
            def index
                lenses = Lense.order(:id)
                render json: {status: "success", lenses: lenses}
            end

            def create
                if current_user.role == "admin"
                    lense = Lense.create!(lens_params)
                    render json: {lense: lense }, status: :created
                else
                    render json: {message: "user is not allowd to create" }, status: 401
                end
            end

            private
            def lens_params
                params.permit(:color, :description, :prescription_type, :lens_type, :stock, :price)
            end
        end
    end
end