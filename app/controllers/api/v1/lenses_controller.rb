module Api
    module V1
        class LensesController < ApplicationController
            def index
                lenses = Lense.order(:id)
                render json: {status: "success", lenses: lenses}
            end

            def create
                if current_user.role == "admin"
                    lense = Lense.new(lens_params)
                    if lense.save
                        message = lense
                    end
                else
                    message = "user not allowd to create"
                end
                render json: {lense: message }, status: :created   
            end

            private
            def lens_params
                params.permit(:color, :description, :prescription_type, :lens_type, :stock, :price)
            end
        end
    end
end