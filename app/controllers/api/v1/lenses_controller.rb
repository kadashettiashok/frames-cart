module Api
    module V1
        class LensesController < ApplicationController
            def index
                lenses = Lense.all
            end

            def create
                lense = Lense.new(lens_params)
                if lense.save
                    render json: {status: "created", data: lense}, status: 200
                end   
            end

            private
            def lens_params
                params.permit(:color, :description, :prescription_type, :lens_type, :stock, :price)
            end
        end
    end
end