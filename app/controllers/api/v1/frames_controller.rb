module Api
    module V1
        class FramesController < ApplicationController

            def index
                if current_user.role == "admin"
                    frames = Frame.order(:id)
                else
                    frames = Frame.where(status: "active")
                end
                render json: {frame: frames }, status: 200
            end

            def create
                if current_user.role == "admin"
                    frame = Frame.new(frame_params)
                    if frame.save
                        message = frame
                    end
                else
                    message = "user not allowd to create"
                end
                render json: {frame: message }, status: :created
            end

            private
            def frame_params
                params.permit(:name, :description, :status, :stock, :price)
            end
        end
    end
end